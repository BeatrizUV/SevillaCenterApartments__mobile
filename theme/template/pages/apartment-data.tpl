<?php
    $slug = $page['data'];
    
    $tokens = explode('.', $slug);
    $building = $tokens[2];
    $aptId = $tokens[4];
    $iCalUrl = 'https://wubook.net/wbkd/ical/'.$language['content']['apartments'][$building]['list'][$aptId]['ical'].'.ics';
    $wubookId = $language['content']['apartments'][$building]['list'][$aptId]['wubook-id'];
    
    $metadata = 'apartment-data_'.$aptId;
    $current = 'apartment-'.$aptId; 
    include($dir.'/theme/template/partials/header.tpl');
?>
            <div class="content" data-role="content" id="apartment-data">
                <h1><?php trans($slug.'.name'); ?></h1>
                <div id="gallery-slider">
                    <?php
                        $size = $language['content']['apartments'][$building]['list'][$aptId]['images'];
                        $cont = 1;

                        for ($cont = 1; $cont <= $size; $cont++) {
                    ?>
                    <img <?php if ($cont == 1) { echo 'id="first"'; } ?> title="<?php trans($slug.'.name'); ?>" src="<?php trans($slug.'.images-path'); ?>_<?php echo $cont;?>.jpg" alt="<?php trans($slug.'.name'); ?>" />
                    <?php
                        }
                    ?>
                </div>
                <div id="slider-controls">
                    <a data-role="button" data-icon="carat-l" data-iconpos="notext" id="slider-left" href="#!" class="slider-control-disabled">&lt;</a>
                    <a data-role="button" data-icon="carat-r" data-iconpos="notext" id="slider-right" href="#!">&gt;</a>
                </div>
                <table data-role="table" data-mode="column" class="ui-responsive ui-shadow" id="apt-description-table">
                    <thead>
                        <tr>
                            <th colspan='2'><h3><?php trans('content.apt-labels.description'); ?></h3></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="label"><?php trans('content.apt-labels.price'); ?></td>
                            <td><?php trans('content.apt-labels.from'); ?> <?php trans($slug.'.description.price'); ?> &euro;</td>
                        </tr>
                        <tr>
                            <td class="label"><?php trans('content.apt-labels.size'); ?></td>
                            <td><?php trans($slug.'.description.size'); ?> <?php echo $unit; ?></td>
                        </tr>
                        <tr>
                            <td class="label"><?php trans('content.apt-labels.guests'); ?></td>
                            <td><?php trans($slug.'.description.guests'); ?></td>
                        </tr>
                        <tr>
                            <td class="label"><?php trans('content.apt-labels.rooms'); ?></td>
                            <td><?php trans($slug.'.description.rooms'); ?></td>
                        </tr>
                        <tr>
                            <td class="label"><?php trans('content.apt-labels.bathrooms'); ?></td>
                            <td><?php trans($slug.'.description.bathrooms'); ?></td>
                        </tr>
                        <tr>
                            <td class="label"><?php trans('content.apt-labels.kitchen'); ?></td>
                            <td><?php trans($slug.'.description.kitchen'); ?></td>
                        </tr>
                        <tr>
                            <td class="label"><?php trans('content.apt-labels.terrace'); ?></td>
                            <td><?php trans($slug.'.description.terrace'); ?></td>
                        </tr>
                        <tr>
                            <td class="label"><?php trans('content.apt-labels.courtyard'); ?></td>
                            <td><?php trans($slug.'.description.courtyard'); ?></td>
                        </tr>
                    </tbody>
                </table>
                <br />
                <table data-role="table" data-mode="column" class="ui-responsive ui-shadow" id="apt-availability-table">
                    <thead>
                        <tr>
                            <th><h3><?php trans('content.apt-labels.availability'); ?></h3></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><?php __wb_getCalendar($iCalUrl, $lang); ?></td>
                        </tr>
                        <tr>
                            <td><a title="<?php trans('content.apt-labels.reserve'); ?> <?php trans($slug.'.name'); ?>" href="#booking-engine" data-rel="dialog" data-role="button" class="booking-apartment-btn"><?php trans('content.apt-labels.reserve'); ?></a></td>
                        </tr>
                    </tbody>
                </table>
                <br />
                <table data-role="table" data-mode="column" class="ui-responsive ui-shadow" id="apt-equipment-table">
                    <thead>
                        <tr>
                            <th colspan='2'><h3><?php trans('content.apt-labels.equipment'); ?></h3></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><a href="#!" data-role="button" data-icon="check" data-iconpos="top"><?php trans('content.apt-labels.a/c'); ?></a></td>
                            <td><a href="#!" data-role="button" data-icon="check" data-iconpos="top"><?php trans('content.apt-labels.wifi'); ?></a></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="more-equipment"><?php trans('content.apt-labels.more-equipment'); ?></td>
                        </tr>
                    </tbody>
                </table>
                <br />
                <table data-role="table" data-mode="column" class="ui-responsive ui-shadow" id="apt-blueprint-table">
                    <thead>
                        <tr>
                            <th><h3><?php trans('content.apt-labels.blueprint'); ?></h3></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><a title="<?php trans('content.apt-labels.blueprint'); ?> <?php trans($slug.'.name'); ?>" href="<?php trans($slug.'.blueprint'); ?>" target="_blank"><img title="<?php trans($slug.'.name'); ?>" src="<?php trans($slug.'.blueprint'); ?>" alt="<?php trans($slug.'.name'); ?>" /></a></td>
                        </tr>
                    </tbody>
                </table>
            </div>    
<?php include($dir.'/theme/template/partials/footer.tpl'); ?>