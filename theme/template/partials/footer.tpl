            <?php
                require_once($dir.'/includes/cache-end.php');
                
                if ($current != 'home') {
            ?>
            <footer data-role="footer" data-tap-toggle="false" data-theme="b" id="advertisement">
                <p>&copy; <?php echo date('Y', time()); ?> SevillaCenterApartments&nbsp;|&nbsp;<a title="<?php trans('content.footer.legal.title'); ?>" href="<?php trans('content.footer.legal.url'); ?>" data-ajax="false" rel="nofollow"><?php trans('content.footer.legal.title'); ?></a>&nbsp;|&nbsp;<a title="<?php trans('content.footer.privacy.title'); ?>" href="<?php trans('content.footer.privacy.url'); ?>" rel="nofollow" data-ajax="false"><?php trans('content.footer.privacy.title'); ?></a></p>
            </footer>            
            <?php
                }
            ?>
            <footer data-role="footer" data-position="fixed" data-theme="b" data-tap-toggle="false">
                <nav data-role="navbar" id="shortcut-bar">
                    <ul class="contact-icons">
                        <li><a href="mailto:info@sevillacenterapartments.com?subject=<?php trans('content.footer.subject'); ?>" data-icon="mail" data-theme="a"><?php trans('content.footer.email'); ?></a></li>
                        <li><a href="tel:0034634014280" data-icon="phone"><?php trans('content.footer.phone'); ?></a></li>
                    </ul>
                    <?php if ($current == 'home') { ?>
                    <ul>
                        <li><a href="#booking-engine" data-rel="dialog" data-icon="calendar"><?php trans('content.footer.booking'); ?></a></li>
                    </ul>
                    <?php } ?>
                </nav>   
            </footer>
            <?php include($dir.'/theme/template/partials/cookies-alert.tpl'); ?>
        </section>
        
        <?php include($dir.'/theme/template/partials/booking-form.tpl'); ?>
        <?php include($dir.'/theme/template/partials/scripts.tpl'); ?>     
    </body>
</html>