<?php
    if (($current != '404') && ($time > $hora+86400)) {
        $fp = fopen($file, 'w+'); // abrimos el fichero de cach�
        fwrite($fp, ob_get_contents()); // guardamos el contenido de la p�gina generada en el fichero
        fclose($fp); // cerramos el fichero
        ob_end_flush(); // devolvemos la p�gina que se ha generado y cerramos la memoria
    }
?>

