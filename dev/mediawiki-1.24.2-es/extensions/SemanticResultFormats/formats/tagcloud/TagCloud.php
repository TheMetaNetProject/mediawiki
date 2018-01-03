<?php

namespace SRF;

use SMW\ResultPrinter;
use SMWDataValue;
use SMWQueryResult;
use SMWPrintRequest;
use SMWResultArray;
use SRFUtils;
use SMWOutputs;

use Html;
use Title;

/**
 * Result printer that prints query results as a tag cloud
 *
 * @since 1.5.3
 *
 * @file
 * @ingroup SRF
 * @ingroup QueryPrinter
 *
 * @licence GNU GPL v2 or later
 * @author Jeroen De Dauw < jeroendedauw@gmail.com >
 * @author mwjames
 */

/**
 * Result printer that prints query results as a tag cloud
 *
 * @ingroup SRF
 * @ingroup QueryPrinter
 */
class TagCloud extends ResultPrinter {

	/**
	 * Contains html generated tags
	 * @var array
	 */
	protected $tagsHtml = array();

	/**
	 * Get a human readable label for this printer.
	 *
	 * @return string
	 */
	public function getName() {
		return $this->msg( 'srf_printername_tagcloud' )->text();
	}

	/**
	 * Return serialised results in specified format
	 *
	 * @param SMWQueryResult $queryResult
	 * @param $outputmode
	 *
	 * @return string
	 */
	public function getResultText( SMWQueryResult $queryResult, $outputmode ) {

		$tags = $this->getTags( $queryResult, $outputmode );

		if ( $tags === array() ) {
			$queryResult->addErrors( array( $this->msg( 'smw_result_noresults' )->inContentLanguage()->text() ) );
			return '';
		}

		// Check output conditions
		if ( ( $this->params['widget'] == 'sphere' ) &&
			( $this->params['link'] !== 'all' ) &&
			( $this->params['template'] === '' ) ) {
			$queryResult->addErrors( array( $this->msg( 'srf-error-option-link-all', 'sphere' )->inContentLanguage()->text() ) );
			return '';
		}

		// Template support
		$this->hasTemplates = $this->params['template'] !== '';
		$this->isHTML = ( $this->getTitle() instanceof Title && $this->getTitle()->isSpecialPage() ) && !$this->hasTemplates;

		// Register RL module
		if ( in_array( $this->params['widget'], array( 'sphere', 'wordcloud' ) ) ) {
			SMWOutputs::requireResource( 'ext.srf.formats.tagcloud' );
		}

		return $this->getTagCloud( $this->getTagSizes( $tags ) );
	}

	/**
	 * Returns an array with the tags (keys) and the number of times they occur (values).
	 *
	 * @since 1.5.3
	 *
	 * @param SMWQueryResult $queryResult
	 * @param $outputMode
	 *
	 * @return array
	 */
	protected function getTags( SMWQueryResult $queryResult, $outputMode ) {
		$tags = array();
		$excludetags = explode( ';', $this->params['excludetags'] );

		/**
		 * @var SMWResultArray $row
		 * @var SMWDataValue $dataValue
		 */
		while ( $row = $queryResult->getNext() ) { // Objects (pages)
			for ( $i = 0, $n = count( $row ); $i < $n; $i++ ) { // SMWResultArray for a sinlge property

				while ( ( $dataValue = $row[$i]->getNextDataValue() ) !== false ) { // Data values

					$isSubject = $row[$i]->getPrintRequest()->getMode() == SMWPrintRequest::PRINT_THIS;

					// If the main object should not be included, skip it.
					if ( $i == 0 && !$this->params['includesubject'] && $isSubject ) {
						continue;
					}

					// Get the HTML for the tag content. Pages are linked, other stuff is just plaintext.
					if ( $dataValue->getTypeID() === '_wpg' && $dataValue->getTitle() instanceof Title ) {
						$value = $dataValue->getTitle()->getText();
						$html = $dataValue->getLongText( $outputMode, $this->getLinker( $isSubject ) );
					} else {
						$html = $dataValue->getShortText( $outputMode, $this->getLinker( false ) );
						$value = $html;
					}

					// Exclude tags from result set
					if ( in_array( $value, $excludetags ) ) {
						continue;
					}

					// Replace content with template inclusion
					$html = $this->params['template'] !== '' ? $this->addTemplateOutput ( $value , $rownum ) : $html;

					// Store the HTML separately, so sorting can be done easily
					if ( !array_key_exists( $value, $tags ) ) {
						$tags[$value] = 0;
						$this->tagsHtml[$value] = $html;
					}

					$tags[$value]++;
				}
			}
		}

		foreach ( $tags as $name => $count ) {
			if ( $count < $this->params['mincount'] ) {
				unset( $tags[$name] );
			}
		}

		return $tags;
	}

	/**
	 * Determines the sizes of tags.
	 * This method is based on code from the FolkTagCloud extension by Katharina Wäschle.
	 *
	 * @since 1.5.3
	 *
	 * @param array $tags
	 *
	 * @return array
	 */
	protected function getTagSizes( array $tags ) {
		if ( count( $tags ) == 0 ) {
			return $tags;
		}

		// If the original order needs to be kept, we need a copy of the current order.
		if ( $this->params['tagorder'] == 'unchanged' ) {
			$unchangedTags = array_keys( $tags );
		}

		arsort( $tags, SORT_NUMERIC );

		if ( count( $tags ) > $this->params['maxtags'] ) {
			$tags = array_slice( $tags, 0, $this->params['maxtags'], true );
		}

		$min = end( $tags ) or $min = 0;
		$max = reset( $tags ) or $max = 1;
		$maxSizeIncrease = $this->params['maxsize'] - $this->params['minsize'];

		// Loop over the tags, and replace their count by a size.
		foreach ( $tags as &$tag ) {
			switch ( $this->params['increase'] ) {
				case 'linear':
					$divisor = ($max == $min) ? 1 : $max - $min;
					$tag = $this->params['minsize'] + $maxSizeIncrease * ( $tag - $min ) / $divisor;
					break;
				case 'log' : default :
					$divisor = ($max == $min) ? 1 : log( $max ) - log( $min );
					$tag = $this->params['minsize'] + $maxSizeIncrease * ( log( $tag ) - log( $min ) ) / $divisor ;
					break;
			}
		}

		switch ( $this->params['tagorder'] ) {
			case 'desc' :
				// Tags are already sorted desc
				break;
			case 'asc' :
				asort( $tags );
				break;
			case 'alphabetical' :
				$tagNames = array_keys( $tags );
				natcasesort( $tagNames );
				$newTags = array();

				foreach ( $tagNames as $name ) {
					$newTags[$name] = $tags[$name];
				}

				$tags = $newTags;
				break;
			case 'random' :
				$tagSizes = $tags;
				shuffle( $tagSizes );
				$newTags = array();

				foreach ( $tagSizes as $size ) {
					foreach ( $tags as $tagName => $tagSize ) {
						if ( $tagSize == $size ) {
							$newTags[$tagName] =  $tags[$tagName];
							break;
						}
					}
				}

				$tags = $newTags;
				break;
			case 'unchanged' : default : // Restore the original order.
				$changedTags = $tags;
				$tags = array();

				foreach ( $unchangedTags as $name ) {
					// Original tags might have been left out at this point, so only add remaining ones.
					if ( array_key_exists( $name, $changedTags ) ) {
						$tags[$name] = $changedTags[$name];
					}
				}
				break;
		}

		return $tags;
	}

	/**
	 * Returns the HTML for the tag cloud.
	 *
	 * @since 1.5.3
	 *
	 * @param array $tags
	 *
	 * @return string
	 */
	protected function getTagCloud( array $tags ) {

		// Initialize
		$htmlTags      = array();
		$processing    = '';
		$htmlSTags     = '';
		$htmlCTags     = '';

		// Count actual output and store div identifier
		$tagId = 'srf-' . uniqid();

		// Determine HTML element marker
		$element = $this->params['widget'] !== '' ? 'li' : 'span';

		// Add size information
		foreach ( $tags as $name => $size ) {
			$htmlTags[] = Html::rawElement( $element, array (
				'style' => "font-size:$size%" ),
				$this->tagsHtml[$name]
			);
		}

		// Stringify
		$htmlSTags = implode( ' ', $htmlTags );

		// Handle sphere/canvas output objects
		if ( in_array( $this->params['widget'], array( 'sphere', 'wordcloud' ) ) ) {

			// Wrap LI/UL elements
			$htmlCTags = Html::rawElement( 'ul', array (
				'style' => 'display:none;'
				), $htmlSTags
			);

			// Wrap tags
			$htmlCTags = Html::rawElement( 'div', array (
				'id'    => $tagId . '-tags',
				'class' => 'srf-tags'
				), $htmlCTags
			);

			// Wrap everything in a container object
			$htmlSTags = Html::rawElement( 'div', array (
				'id'     => $tagId . '-container',
				'class'  => 'srf-container',
				'data-width'  => $this->params['width'],
				'data-height' => $this->params['height'],
				'data-font'   => $this->params['font']
				), $htmlCTags
			);

			// Processing placeholder
			$processing = SRFUtils::htmlProcessingElement();
		}

		// Beautify class selector
		$class = $this->params['widget'] ?  '-' . $this->params['widget'] . ' ' : '';
		$class = $this->params['class'] ? $class . ' ' . $this->params['class'] : $class ;

		// General placeholder
		$attribs = array (
			'class'  => 'srf-tagcloud' . $class,
			'data-version' => '0.4.1',
			'align'  => 'justify'
		);

		return Html::rawElement( 'div', $attribs, $processing . $htmlSTags );
	}

	/**
	 * Create a template output
	 *
	 * @since 1.8
	 *
	 * @param $value
	 * @param $rownum
	 *
	 * @return string
	 */
	protected function addTemplateOutput( $value, &$rownum ) {
		$rownum++;
		$wikitext  = $this->params['userparam'] ? "|userparam=" . $this->params['userparam'] : '';
		$wikitext .= "|" . $value;
		$wikitext .= "|#=$rownum";
		return '{{' . trim ( $this->params['template'] ) . $wikitext . '}}';
	}

	/**
	 * @see ResultPrinter::getParamDefinitions
	 *
	 * @since 1.8
	 *
	 * @param $definitions array of IParamDefinition
	 *
	 * @return array of IParamDefinition|array
	 */
	public function getParamDefinitions( array $definitions ) {
		$params = parent::getParamDefinitions( $definitions );

		$params['template'] = array(
			'message' => 'srf-paramdesc-template',
			'default' => '',
		);

		$params['userparam'] = array(
			'message' => 'srf-paramdesc-userparam',
			'default' => '',
		);

		$params['excludetags'] = array(
			'message' => 'srf-paramdesc-excludetags',
			'default' => '',
		);

		$params['includesubject'] = array(
			'type' => 'boolean',
			'message' => 'srf-paramdesc-includesubject',
			'default' => false,
		);

		$params['tagorder'] = array(
			'message' => 'srf_paramdesc_tagorder',
			'default' => 'alphabetical',
			'values' => array( 'alphabetical', 'asc', 'desc', 'random', 'unchanged' ),
		);

		$params['increase'] = array(
			'message' => 'srf_paramdesc_increase',
			'default' => 'log',
			'values' => array( 'linear', 'log' ),
		);

		$params['widget'] = array(
			'message' => 'srf-paramdesc-widget',
			'default' => '',
			'values' => array( 'sphere', 'wordcloud' ),
		);

		$params['class'] = array(
			'message' => 'srf-paramdesc-class',
			'default' => '',
		);

		$params['font'] = array(
			'message' => 'srf-paramdesc-font',
			'default' => 'impact',
		);

		$params['height'] = array(
			'type' => 'integer',
			'message' => 'srf-paramdesc-height',
			'default' => 400,
			'lowerbound' => 1,
		);

		$params['width'] = array(
			'type' => 'integer',
			'message' => 'srf-paramdesc-width',
			'default' => 400,
			'lowerbound' => 1,
		);

		$params['mincount'] = array(
			'type' => 'integer',
			'message' => 'srf_paramdesc_mincount',
			'default' => 1,
			'manipulatedefault' => false,
		);

		$params['minsize'] = array(
			'type' => 'integer',
			'message' => 'srf_paramdesc_minsize',
			'default' => 77,
			'manipulatedefault' => false,
		);

		$params['maxsize'] = array(
			'type' => 'integer',
			'message' => 'srf_paramdesc_maxsize',
			'default' => 242,
			'manipulatedefault' => false,
		);

		$params['maxtags'] = array(
			'type' => 'integer',
			'message' => 'srf_paramdesc_maxtags',
			'default' => 1000,
			'lowerbound' => 1,
		);

		return $params;
	}
}