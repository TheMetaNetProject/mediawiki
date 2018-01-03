<?php
/**
 * Anonymous users (*): can read and create/edit talk pages
 * Logged in users (user): can edit
 * There's no need for an analyst distinction, but we'll keep the category
 * around.
 */
# anonymous users can edit certain talk pages
$wgGroupPermissions['*']['edit']  = true;
$wgGroupPermissions['*']['createtalk']  = true;

$metaNetTalkNamespaces = array(551,553,555,557,561,563,565);
$allNamespaces = array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
                       500, 501, 502, 503, 550, 551, 552, 553, 554,
                       555, 556, 557, 558, 559, 560, 561, 562, 563, 564, 565,
                       570, 571, 800, 801, 102, 103, 108, 109, 106,
                       107, 274, 275, 104, 105);
foreach ($allNamespaces as $nsid) {
    if (in_array($nsid, $metaNetTalkNamespaces)) {
        continue;
    }
    $wgNamespacePermissionLockdown[$nsid]['edit'] = array('user');
    $wgNamespacePermissionLockdown[$nsid]['createtalk'] = array('user');
}
