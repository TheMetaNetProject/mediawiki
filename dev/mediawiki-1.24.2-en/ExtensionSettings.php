<?php
/**
 * Extension inclusions
 */


##
# Extension: Cite
#

require_once "$IP/extensions/Cite/Cite.php";


##
# Extension: ConfirmEdit
#

require_once "$IP/extensions/ConfirmEdit/ConfirmEdit.php";

/**
* Settings for the ConfirmEdit extension
*/

# do not subject authenticated users to captcha's
$wgGroupPermissions['*'            ]['skipcaptcha'] = false;
$wgGroupPermissions['autoconfirmed']['skipcaptcha'] = false;
$wgGroupPermissions['user'         ]['skipcaptcha'] = true;
$wgGroupPermissions['bot'          ]['skipcaptcha'] = true; // registered bots
$wgGroupPermissions['sysop'        ]['skipcaptcha'] = true;

# enable captcha's on edit and create (not just on account creation)
$wgCaptchaTriggers['edit']          = true;
$wgCaptchaTriggers['create']        = true;


# use questy captcha: supposedly more effective
require_once "$IP/extensions/ConfirmEdit/QuestyCaptcha.php";

$wgCaptchaQuestions[] = array( 'question' => "Metaphors are not linguistic.  They are ...", 'answer' => "conceptual");
$wgCaptchaQuestions[] = array( 'question' => "A place where you can find many frames.", 'answer' => "framenet" );
$wgCaptchaQuestions[] = array( 'question' => "The C in ECG", 'answer' => array("construction", "cxn") );
$wgCaptchaQuestions[] = array( 'question' => "Another word for frame element.", 'answer' => array( 'role', 'participant' ) );

##
# Extension: Gadgets
#

require_once "$IP/extensions/Gadgets/Gadgets.php";


##
# Extension: ImageMap
#

require_once "$IP/extensions/ImageMap/ImageMap.php";


##
# Extension: InputBox
#

require_once "$IP/extensions/InputBox/InputBox.php";


##
# Extension: Interwiki
#

require_once "$IP/extensions/Interwiki/Interwiki.php";


##
# Extension: LocalisationUpdate
#

require_once "$IP/extensions/LocalisationUpdate/LocalisationUpdate.php";


##
# Extension: Nuke
#

require_once "$IP/extensions/Nuke/Nuke.php";


##
# Extension: ParserFunctions
#

require_once "$IP/extensions/ParserFunctions/ParserFunctions.php";

/**
* Settings for the ParserFunctions extension
*/

# enable String functions
$wgPFEnableStringFunctions = true;

##
# Extension: Poem
#

require_once "$IP/extensions/Poem/Poem.php";


##
# Extension: Renameuser
#

require_once "$IP/extensions/Renameuser/Renameuser.php";


##
# Extension: SpamBlacklist
#

require_once "$IP/extensions/SpamBlacklist/SpamBlacklist.php";


##
# Extension: SyntaxHighlight_GeSHi
#

require_once "$IP/extensions/SyntaxHighlight_GeSHi/SyntaxHighlight_GeSHi.php";


##
# Extension: TitleBlacklist
#

require_once "$IP/extensions/TitleBlacklist/TitleBlacklist.php";


##
# Extension: WikiEditor
#

require_once "$IP/extensions/WikiEditor/WikiEditor.php";


##
# Extension: AdminLinks
#

require_once "$IP/extensions/AdminLinks/AdminLinks.php";


##
# Extension: Arrays
#

require_once "$IP/extensions/Arrays/Arrays.php";


##
# Extension: CSS
#

require_once "$IP/extensions/CSS/CSS.php";


##
# Extension: CodeEditor
#

require_once "$IP/extensions/CodeEditor/CodeEditor.php";


##
# Extension: ConfirmAccount
#

require_once "$IP/extensions/ConfirmAccount/ConfirmAccount.php";

/**
* Settings for the ConfirmAccount extension
*/

$wgConfirmAccountContact = 'lucag@icsi.berkeley.edu';
$wgMakeUserPageFromBio = true;
$wgAutoWelcomeNewUsers = false;
$wgConfirmAccountRequestFormItems = array(
'UserName'        => array( 'enabled' => true ),
'RealName'        => array( 'enabled' => true ),
'Biography'       => array( 'enabled' => false, 'minWords' => 25 ),
'AreasOfInterest' => array( 'enabled' => false ),
'CV'              => array( 'enabled' => false ),
'Notes'           => array( 'enabled' => true ),
'Links'           => array( 'enabled' => true ),
'TermsOfService'  => array( 'enabled' => true ),
);

##
# Extension: ConfirmEdit
#

require_once "$IP/extensions/ConfirmEdit/ConfirmEdit.php";

/**
* Settings for the ConfirmEdit extension
*/

# do not subject authenticated users to captcha's
$wgGroupPermissions['*'            ]['skipcaptcha'] = false;
$wgGroupPermissions['autoconfirmed']['skipcaptcha'] = false;
$wgGroupPermissions['user'         ]['skipcaptcha'] = true;
$wgGroupPermissions['bot'          ]['skipcaptcha'] = true; // registered bots
$wgGroupPermissions['sysop'        ]['skipcaptcha'] = true;

# enable captcha's on edit and create (not just on account creation)
$wgCaptchaTriggers['edit']          = true;
$wgCaptchaTriggers['create']        = true;


# use questy captcha: supposedly more effective
require_once "$IP/extensions/ConfirmEdit/QuestyCaptcha.php";

$wgCaptchaQuestions[] = array( 'question' => "Metaphors are not linguistic.  They are ...", 'answer' => "conceptual");
$wgCaptchaQuestions[] = array( 'question' => "A place where you can find many frames.", 'answer' => "framenet" );
$wgCaptchaQuestions[] = array( 'question' => "The C in ECG", 'answer' => array("construction", "cxn") );
$wgCaptchaQuestions[] = array( 'question' => "Another word for frame element.", 'answer' => array( 'role', 'participant' ) );

##
# Extension: DataTransfer
#

require_once "$IP/extensions/DataTransfer/DataTransfer.php";


##
# Extension: DiscussionThreading
#

require_once "$IP/extensions/DiscussionThreading/DiscussionThreading.php";


##
# Extension: DismissableSiteNotice
#

require_once "$IP/extensions/DismissableSiteNotice/DismissableSiteNotice.php";


##
# Extension: DynamicSidebar
#

require_once "$IP/extensions/DynamicSidebar/DynamicSidebar.php";

/**
* Settings for the DynamicSidebar extension
*/

// Enable debugging
//$wgDebugLogGroups["dynamic-sidebar"] = "/tmp/sidebar-debug.txt";

// Allow users to create their own custom sidebars under User:<username>/Sidebar
// Default: true
$wgDynamicSidebarUseUserpages = true;

// Allow group sidebars under MediaWiki:Sidebar/Group:<group>
// Default: true
$wgDynamicSidebarUseGroups = true;

// Allow category based sidebars under MediaWiki:Sidebar/Category:<category>
// Default: true
$wgDynamicSidebarUseCategories = true;

##
# Extension: ExternalData
#

require_once "$IP/extensions/ExternalData/ExternalData.php";


##
# Extension: HeaderTabs
#

require_once "$IP/extensions/HeaderTabs/HeaderTabs.php";


##
# Extension: Lockdown
#

require_once "$IP/extensions/Lockdown/Lockdown.php";


##
# Extension: Loops
#

require_once "$IP/extensions/Loops/Loops.php";

/**
* Settings for the Loops extension
*/

# allow unlimited looping (until memory runs out)
ExtLoops::$maxLoops = -1;

##
# Extension: PageSchemas
#

require_once "$IP/extensions/PageSchemas/PageSchemas.php";


##
# Extension: Push
#

require_once "$IP/extensions/Push/Push.php";

/**
 * Settings for the Push extension
 */

$langWikis =  array('en' => 'English Wiki',
					'es' => 'Spanish Wiki',
					'ru' => 'Russian Wiki',
					'fa' => 'Persian Wiki');

// don't allow pushing to self
$langCode = substr($wgScriptPath,-2);
unset($langWikis[$langCode]);

$scriptPref = substr($wgScriptPath, 0, -2);

foreach ($langWikis as $lang => $wikiname) {
	$egPushTargets[$wikiname] = $wgServer + $scriptPref + $lang;
}
$egPushLoginUser = 'Mnadmin';
$egPushLoginPassword = 'm4sBwy0u!';
$wgGroupPermissions['autoconfirmed']['push'] = false;
$wgGroupPermissions['autoconfirmed']['bulkpush'] = false;
$wgGroupPermissions['autoconfirmed']['filepush'] = false;


##
# Extension: ReplaceSet
#

require_once "$IP/extensions/ReplaceSet/ReplaceSet.php";
$egReplaceSetCallLimit = 5000;
$egReplaceSetPregLimit = 5000;

##
# Extension: ReplaceText
#

require_once "$IP/extensions/ReplaceText/ReplaceText.php";


##
# Extension: SemanticCompoundQueries
#

require_once "$IP/extensions/SemanticCompoundQueries/SemanticCompoundQueries.php";


##
# Extension: SemanticExtraSpecialProperties
#

require_once "$IP/extensions/SemanticExtraSpecialProperties/SemanticExtraSpecialProperties.php";


##
# Extension: SemanticFormsInputs
#

#require_once "$IP/extensions/SemanticFormsInputs/SemanticFormsInputs.php";


##
# Extension: Variables

require_once "$IP/extensions/Variables/Variables.php";


##
# Extension: Widgets
#

require_once "$IP/extensions/Widgets/Widgets.php";


##
# Extension: PipeEscape
#

require_once "$IP/extensions/PipeEscape/PipeEscape.php";


##
# Extension: MetaNetGraph
#

require_once "$IP/extensions/MetaNetGraph/MetaNetGraph.php";


##
# Extension: JavaScript
#

require_once "$IP/extensions/JavaScript/JavaScript.php";


##
# Extension: FrameNetQuery
#

require_once "$IP/extensions/FrameNetQuery/FrameNetQuery.php";

##
# Extension: MetaNet Wiki Tools
#

require_once "$IP/extensions/MetaNetWikiTools/MetaNetWikiTools.php";

## It's complaining about the absence of these...
#

require_once "$IP/extensions/PageForms/PageForms.php";

