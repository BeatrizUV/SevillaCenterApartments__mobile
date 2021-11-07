            <nav data-role="navbar" id="menu">
                <ul>
                    <li><a href="<?php trans('content.menu.apartments.url'); ?>"<?php if(preg_match('/apartment/i', $current)){echo ' class="ui-btn-active"';} ?> data-ajax="false" id="apartments-button-menu"><?php trans('content.menu.apartments.title'); ?></a></li>
                    <li><a href="#booking-engine" data-rel="dialog" data-transition="pop" id="booking-button-menu"><?php trans('content.footer.booking'); ?></a></li>
                </ul>
            </nav>