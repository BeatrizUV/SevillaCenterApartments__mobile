<?php require_once($dir.'/includes/cache-start.php'); ?>    
<!DOCTYPE html>
<html lang='<?php echo $lang; ?>' manifest="/cache.appcache" prefix="og: http://ogp.me/ns#">
    <head>
        <meta charset="<?php echo $charset; ?>" />
        <title><?php trans('meta.'.$metadata.'.title'); ?></title>
        <meta name="title" content="<?php trans('meta.'.$metadata.'.title'); ?>" />
        <meta name="keywords" content="<?php trans('meta.'.$metadata.'.keywords'); ?>" />
        <meta name="description" content="<?php trans('meta.'.$metadata.'.description'); ?>" />
        <?php include($dir.'/theme/template/partials/og-metatags.tpl'); ?>    
        <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
        <meta name="theme-color" content="#000" />      
        <meta name="revisit" content="7 days" />
        
        <link rel="canonical" href="<?php trans('meta.'.$metadata.'.canonical'); ?>" />  
        <link rel="alternate" hreflang="<?php echo $alter; ?>" href="<?php alter($metadata); ?>" />
        <link rel="icon" sizes="192x192" href="/theme/images/favicon.png" /> 
        <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" type="text/css" />
        <link rel="stylesheet" href="/theme/css/customs.min.css" type="text/css" />
        
        <script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>   
        <script src="/theme/js/google-analytics.min.js"></script>   
    </head>

    <body id="<?php echo $current; ?>">
        <section id="page-<?php echo $current; ?>" data-role="page">
            <header data-role="header" id="header-logo">
                <h1 id="logo"><a title="Sevilla Center Apartments" href="/<?php echo $lang; ?>" data-ajax="false">Sevilla Center <span class="break">APARTMENTS</span></a></h1>
                <nav id="lang-bar">
                    <a href="/es/" title="Espa&ntilde;ol" id="lang-es" data-ajax="false" rel="alternate" hreflang="es"><img alt="Sevilla Center Apartments en espa&ntilde;ol" src="http://m.sevillacenterapartments.com/theme/images/flag_es.png" /></a>
                    <a href="/en/" title="English" id="lang-en" data-ajax="false" rel="alternate" hreflang="en"><img alt="Sevilla Center Apartments in english" src="http://m.sevillacenterapartments.com/theme/images/flag_en.png" /></a>
                </nav>
            </header>
            <?php include($dir.'/theme/template/partials/menu.tpl'); ?>    