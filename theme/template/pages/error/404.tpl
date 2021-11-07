<?php
    $current = 'error'; 
    include($dir.'/theme/template/partials/header.tpl');
?>
        <div class="content" data-role="content" id="error404">
            <br />
            <img title="<?php trans('error.404.title'); ?>" src="/theme/images/error-404-page-not-found.png" alt="<?php trans('error.404.title'); ?>" />
            <br />
            <h1><?php trans('error.404.title'); ?></h1>
            <br />
            <p><?php trans('error.404.text'); ?></p>
            <br />
        </div>
<?php include($dir.'/theme/template/partials/footer.tpl'); ?>