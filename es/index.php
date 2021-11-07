<?php
    header("Cache-Control: max-age=604800");
    header("Expires: " . date('D, d M Y', (time() + 604800)));
    header("Revisit: 7 days");
    $dir = __DIR__;
    require_once($dir.'/es/config.php');
    $page = getTemplate($lang, $language, $template);
    require_once($dir.'/theme/template/pages/'.$page['tpl'].'.tpl');
?>
