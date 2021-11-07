        <meta property="og:title" content="<?php trans('meta.'.$metadata.'.title'); ?>" />
        <meta property="og:description" content="<?php trans('meta.'.$metadata.'.description'); ?>" />
        <meta property="og:locale" content="<?php echo $locale; ?>" />
        <meta property="og:locale:alternate" content="<?php echo $localeAlter; ?>" />
        <meta property="og:type" content="website" />
        <meta property="og:url" content="<?php echo $alternate[$alter][$metadata]; ?>" />
        <meta property="og:site_name" content="<?php trans('meta.'.$metadata.'.title'); ?>" />
<?php

switch($current) {
            case 'home': ?>
        <meta property="og:determiner" content="" />        
                <?php for($cont = 1; $cont <= 5; $cont++) { ?>                
        <meta property="og:image" content="http://m.sevillacenterapartments.com/images/home/sevilla-center-apartments-0<?php echo $cont; ?>.jpg" />
        <meta property="og:image:url" content="http://m.sevillacenterapartments.com/images/home/sevilla-center-apartments-0<?php echo $cont; ?>.jpg" />
        <meta property="og:image:type" content="image/jpeg" />
        <meta property="og:image:width" content="500" />
        <meta property="og:image:height" content="650" />
                <?php }
                       break;
            case 'apartments': ?>
        <meta property="og:determiner" content="" />        
        <meta property="og:image" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-b1_thumb.jpg" />
        <meta property="og:image:url" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-b1_thumb.jpg" />
        <meta property="og:image:type" content="image/jpeg" />
        <meta property="og:image:width" content="400" />
        <meta property="og:image:height" content="206" />
        <meta property="og:image" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-b2_thumb.jpg" />
        <meta property="og:image:url" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-b2_thumb.jpg" />
        <meta property="og:image:type" content="image/jpeg" />
        <meta property="og:image:width" content="400" />
        <meta property="og:image:height" content="206" />
        <meta property="og:image" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-b3_thumb.jpg" />
        <meta property="og:image:url" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-b3_thumb.jpg" />
        <meta property="og:image:type" content="image/jpeg" />
        <meta property="og:image:width" content="400" />
        <meta property="og:image:height" content="206" />
        <meta property="og:image" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-b4_thumb.jpg" />
        <meta property="og:image:url" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-b4_thumb.jpg" />
        <meta property="og:image:type" content="image/jpeg" />
        <meta property="og:image:width" content="400" />
        <meta property="og:image:height" content="206" />
        <meta property="og:image" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-b5_thumb.jpg" />
        <meta property="og:image:url" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-b5_thumb.jpg" />
        <meta property="og:image:type" content="image/jpeg" />
        <meta property="og:image:width" content="400" />
        <meta property="og:image:height" content="206" />
        <meta property="og:image" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-1i_thumb.jpg" />
        <meta property="og:image:url" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-1i_thumb.jpg" />
        <meta property="og:image:type" content="image/jpeg" />
        <meta property="og:image:width" content="400" />
        <meta property="og:image:height" content="206" />
        <meta property="og:image" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-1d_thumb.jpg" />
        <meta property="og:image:url" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-1d_thumb.jpg" />
        <meta property="og:image:type" content="image/jpeg" />
        <meta property="og:image:width" content="400" />
        <meta property="og:image:height" content="206" />
        <meta property="og:image" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-2i_thumb.jpg" />
        <meta property="og:image:url" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-2i_thumb.jpg" />
        <meta property="og:image:type" content="image/jpeg" />
        <meta property="og:image:width" content="400" />
        <meta property="og:image:height" content="206" />
        <meta property="og:image" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-2d_thumb.jpg" />
        <meta property="og:image:url" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-2d_thumb.jpg" />
        <meta property="og:image:type" content="image/jpeg" />
        <meta property="og:image:width" content="400" />
        <meta property="og:image:height" content="206" />
        <meta property="og:image" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-ai_thumb.jpg" />
        <meta property="og:image:url" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-ai_thumb.jpg" />
        <meta property="og:image:type" content="image/jpeg" />
        <meta property="og:image:width" content="400" />
        <meta property="og:image:height" content="206" />
        <meta property="og:image" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-ac_thumb.jpg" />
        <meta property="og:image:url" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-ac_thumb.jpg" />
        <meta property="og:image:type" content="image/jpeg" />
        <meta property="og:image:width" content="400" />
        <meta property="og:image:height" content="206" />
        <meta property="og:image" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-ad_thumb.jpg" />
        <meta property="og:image:url" content="http://m.sevillacenterapartments.com/images/apartments/concordia/apartment-ad_thumb.jpg" />
        <meta property="og:image:type" content="image/jpeg" />
        <meta property="og:image:width" content="400" />
        <meta property="og:image:height" content="206" />
                <?php
                       break;
            case (preg_match('/apartment-/i', $current) ? $current : !$current): $aptName = str_replace('apartment-', '', $current); ?>
        <meta property="og:determiner" content="the" />        
                <?php for($cont = 1; $cont <= $language['content']['apartments']['concordia']['list'][$aptName]['images']; $cont++) { ?>                
        <meta property="og:image" content="http://m.sevillacenterapartments.com/images/apartments/concordia/<?php echo $aptName; ?>/sevilla-center-apartments-<?php if ($cont < 10) { echo '0'; } echo $cont; ?>.jpg" />
        <meta property="og:image:url" content="http://m.sevillacenterapartments.com/images/home/sevilla-center-apartments-<?php if ($cont < 10) { echo '0'; } echo $cont; ?>.jpg" />
        <meta property="og:image:type" content="image/jpeg" />
        <meta property="og:image:width" content="500" />
        <meta property="og:image:height" content="650" />
                <?php }
                       break;
            case 'legal': ?>
        <meta property="og:determiner" content="the" />
                <?php
                       break;
            case 'cookies': ?>
        <meta property="og:determiner" content="the" />
                <?php
                       break;
            case 'privacy': ?>
        <meta property="og:determiner" content="the" />
                <?php
                       break;
            case 'error': ?>
        <meta property="og:determiner" content="an" />
                <?php
        }