<?php
    $file = $dir.'/cache/'.$lang.'/'.$current.'.html';
    $time = time();

    if (file_exists($file))
    {
        $hora = filemtime($file); // comprobamos la hora del fichero si ya existiera
    }
    else
    {
        $hora = 0;
    }
  
    if($time <= $hora+86400) { // asignamos un tiempo de cache de 604800 segundos (7 días)
        include($file); // incluimos el contenido del fichero cacheado
        include($dir.'/theme/template/partials/footer.tpl');
        exit;
    }
    else {
        ob_start(); // abrimos la memoria 
    }
?>