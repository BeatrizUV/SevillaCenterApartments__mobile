<?php
    $lang = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
    
    switch ($lang){
        case 'es':
            header('Location: /es/');
            break;
        case 'en':
            header('Location: /en/');
            break;
        default:
            header('Location: /es/');
    }
?>
