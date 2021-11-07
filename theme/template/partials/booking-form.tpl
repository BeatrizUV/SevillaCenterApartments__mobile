        <section id="booking-engine" data-overlay-theme="b" data-title="<?php trans('content.footer.booking'); ?>">
            <header data-role="header"><h1><?php trans('content.footer.booking'); ?></h1></header>
            <div data-role="content" class="content">
                <form id="booking-form" name="booking-form" method="POST" action="<?php trans('content.booking-engine.action'); ?>" data-ajax="false">
                    <label for="arrive"><?php trans('content.booking-engine.arrive'); ?>:</label>
                    <input type="date" name="arrive" id="arrive" value="" />
                    <br />
                    <label for="left"><?php trans('content.booking-engine.left'); ?>:</label>
                    <input type="date" name="left" id="left" value="" />
                    <br />
                    <label for="guests"><?php trans('content.booking-engine.guests'); ?>:</label>
                    <input type="range" name="guests" id="guests" value="1" min="1" max="6" />
                    <br />
                    <input type="hidden" name="lang" id="lang" value="<?php echo $lang; ?>" />
                    <input type="hidden" name="bookrooms" id="bookrooms" value="<?php if (isset($wubookId)) { echo $wubookId; } ?>" />
                    <input type="submit" name="check" id="check" value="<?php trans('content.booking-engine.check'); ?>" />
                </form>
            </div>
        </section>