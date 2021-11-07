<?php
    function trans($key) {
        global $language;
        getToken($language, $key);
    }
    
    function alter($key) {
        global $lang;
        global $alternate;        
        getToken($alternate[$lang], $key);
    }
    
    function getToken($array, $key) {
        $tokens = explode('.', $key);
        $size = count($tokens);
        $cont = 0;
        $arrayA = $array[$tokens[0]];
        $arrayB = null;
        
        for ($cont = 1; $cont < $size; $cont++) {
            $arrayB = $arrayA[$tokens[$cont]];
            $arrayA = $arrayB;
        }        
        
        echo $arrayA;
    }
    
    function getTemplate($lang, $language, $template) {        
        $url = str_replace('/'.$lang.'/', '', trim($_SERVER['REQUEST_URI']));
        $page = array('tpl' => 'home');
        
        if (($url != '') && ($url != 'index.php')) {
            if (in_array($url, $language['urls'])) {
                $page = $template[$url];
            }
            else {
                $page['tpl'] = 'error/404';
            }
        }
        
        return $page;
    }
    
    function __wb_bookingRedirect() {
        $codigo = '1443091911';
        $layout = 'autosole'; // Elegir en el Motor de reservas
        $referrer = 'http://m.sevillacenterapartments.com/';

        if ((isset($_POST['check'])) && (!empty($_POST['check']))) {
            $llegada = $_POST['arrive'];
            $salida = $_POST['left'];
            $huespedes = $_POST['guests'];
            $lang = $_POST['lang'];
            $roomId = $_POST['bookrooms'];

            // validar campos del formulario...
            if (validateBookingInfo($llegada, $salida, $huespedes)) {    
                $fechaLlegada = validateDate($llegada);    
                $fechaSalida = validateDate($salida);   

                if (($fechaLlegada != false) && ($fechaSalida != false)) {                 
                    if ($fechaLlegada == 'today') {
                        $noches = $fechaSalida - parseDateToNumber($llegada); // más o menos
                    }
                    else {
                        $noches = $fechaSalida - $fechaLlegada; // más o menos
                    }
                    
                    header('Location: https://wubook.net/wbkd/wbk/?lcode='.$codigo.'&amp;referrer='.$referrer.'/'.$lang.'&amp;layout='.$layout.'&amp;dfrom='.formatDate($llegada).'&amp;nights='.$noches.'&amp;occupancies='.$huespedes.'&amp;bookrooms='.$roomId);
                    die();
                }
            }
        }
        
        header('Location: https://wubook.net/wbkd/wbk/?lcode='.$codigo.'&amp;referrer='.$referrer.'&amp;layout='.$layout);
        die();
    }
    
    function validateBookingInfo($llegada, $salida, $huespedes) {
        $errores = 0;
        $flag = true;

        if ((trim($llegada) == null) || (trim($llegada) == '') || (trim($llegada) == ' ')) {
            $errores++;       
        }

        if ((trim($salida) == null) || (trim($salida) == '') || (trim($salida) == ' ')) {
            $errores++;
        }

        if ((trim($huespedes) == null) || (trim($huespedes) == '') || (trim($huespedes) == ' ') || ($huespedes == 0)) {
            $errores++;
        }

        if ($errores > 0) {
            $flag = false;
        }

        return $flag;
    }

    function validateDate($fecha) {
        $date = false;
        $curdate = date('Ymd', time());

        if ($fecha == $curdate) {
            $date = 'today';  
        }
        else {
            $date = parseDateToNumber($fecha);
            if ($date <= $curdate) {
                $date = false;
            }      
        }

        return $date;
    }
    
    function parseDateToNumber($fecha) {
        return str_replace('-', '', $fecha);
    }
    
    function formatDate($fecha) {
        $tokens = explode('-', $fecha);
        return $tokens[2].'/'.$tokens[1].'/'.$tokens[0];
    }
    
    function __wb_getCalendar($iCal, $lang) {
        // Obtenemos los datos del día de hoy
        $milisegundos = time();
        //$diaHoy = date('d', $milisegundos);
        $diaHoy = date('j', $milisegundos);
        $mesHoy = date('m', $milisegundos);
        $anoHoy = date('Y', $milisegundos);	
        $diasMes = cal_days_in_month(CAL_GREGORIAN, $mesHoy, $anoHoy);
        $bisiesto = false;	

        // Comprobamos si el año es bisiesto o no
        if (date('L', $milisegundos) == 1) {
            $bisiesto = true;
        }
        
        // Preparamos el array de los días de la semana
        $diasSemana = cargarDiasSemana();

        // Preparamos el array con los meses del año en español e inglés
        $mesesAno = cargarMesesAno();
        // Ahora preparamos los datos del iCal para poder consultarlos desde el bucle
        // Obtenemos los días bloqueados del mes
        $diasBloqueados = cargarDiasBloqueados($iCal, $anoHoy, $mesHoy, $diasMes);

        // Seteamos el primer día del mes
        $primeroMes = $anoHoy.'-'.$mesHoy.'-01';
        // Miramos qué día de la semana es pasándolo a milisegundos previamente
        $diaSemanaPrimeroMes = date('D', strtotime($primeroMes));

        // Mostramos los títulos del widget	
        mostrarTitulosWidget($mesesAno, $mesHoy, $anoHoy, $diasSemana, $lang);
        // Y cargamos el bucle que imprime el calendario
        mostrarCalendario($diasSemana, $diaHoy, $diaSemanaPrimeroMes, $diasMes, $diasBloqueados);
    }
    
    function cargarDiasSemana() {
        $diasSemana = array (
            0 => array('en' => 'Mon', 'es' => 'Lun'),
            1 => array('en' => 'Tue', 'es' => 'Mar'),
            2 => array('en' => 'Wed', 'es' => 'Mi&eacute;'),
            3 => array('en' => 'Thu', 'es' => 'Jue'),
            4 => array('en' => 'Fri', 'es' => 'Vie'),
            5 => array('en' => 'Sat', 'es' => 'S&aacute;b'),
            6 => array('en' => 'Sun', 'es' => 'Dom')
        );

        return $diasSemana;
    }

    function cargarMesesAno() {
        $mesesAno = array(
            '01' => array('es' => 'Enero', 'en' => 'January'),
            '02' => array('es' => 'Febrero', 'en' => 'February'),
            '03' => array('es' => 'Marzo', 'en' => 'March'),
            '04' => array('es' => 'Abril', 'en' => 'April'),
            '05' => array('es' => 'Mayo', 'en' => 'May'),
            '06' => array('es' => 'Junio', 'en' => 'June'),
            '07' => array('es' => 'Julio', 'en' => 'July'),
            '08' => array('es' => 'Agosto', 'en' => 'August'),
            '09' => array('es' => 'Septiembre', 'en' => 'September'),
            '10' => array('es' => 'Octubre', 'en' => 'October'),
            '11' => array('es' => 'Noviembre', 'en' => 'November'),
            '12' => array('es' => 'Diciembre', 'en' => 'December')
        );

        return $mesesAno;
    }

    function cargarTokensICal($calendario) {
        // Seleccionamos el calendario iCal correspondiente y parseamos el calendario
        $iCal = @file_get_contents($calendario);
        $iCal = preg_replace('/[\n|\r|\n\r|\t|\0|\x0B]/', '', $iCal);
        $iCalCortado = substr($iCal, 71, strlen($iCal)); 
        $iCalCortado = str_replace('END:VEVENTBEGIN:VEVENT', ';', $iCalCortado);
        $iCalCortado = str_replace('BEGIN:VEVENT', '', $iCalCortado);
        $iCalCortado = str_replace('END:VEVENTEND:VCALENDAR', '', $iCalCortado);
        $tokensCalendario = explode(';', $iCalCortado);
        $tokensLimpios = array();
        $fechas = array();

        // hacemos arrays con cada línea del array
        /**
         * ### ICAL PATTERN ###
         * UID:20151016T100351Z-25313@ord4;20151016T000000;20151021T000000SUMMARY:RoomId: 128535 - Room not available
         */ 
        foreach($tokensCalendario as $token) {
            $token = str_replace('DTSTART:', ';', $token);
            $token = str_replace('DTEND:', ';', $token);
            $token = str_replace('SUMMARY:', ';', $token);			
            $tokens = explode(';', $token);
            $tokensLimpios[0] = $tokens[1];
            $tokensLimpios[1] = $tokens[2];
            $fechas[] = $tokensLimpios;
        }

        return $fechas;
    }

    function cargarDiasBloqueados($calendario, $anoHoy, $mesHoy, $diasMes) {
        // Dividimos el array en varios más pequeños
        $iCals = cargarTokensICal($calendario);
        $inicioReserva = null;
        $finReserva = null; 
        $cont = 0;
        $diasBloqueados = array();

        /**
         * ### ICAL PATTERN ###
         * 2 => 20151015T000000
         * 3 => 20151022T000000
         */

        // Buscamos las reservas que tengan días bloqueados en el mes vigente
        foreach ($iCals as $i) {
            // Para las reservas que coincidan con el mes vigente		
            if ((preg_match('/'.$anoHoy.$mesHoy.'/i', $i[0])) || (preg_match('/'.$anoHoy.$mesHoy.'/i', $i[1]))) {
                // Miramos si empieza la reserva dentro del mes			
                if (preg_match('/'.$anoHoy.$mesHoy.'/i', $i[0])) {
                    $inicioReserva = str_replace($anoHoy.$mesHoy, '', $i[0]);
                    $inicioReserva = str_replace('T000000', '', $inicioReserva);				
                    
                    // Quitamos los '0' de los números menores de 10
                    if (($inicioReserva + 0) < 10) {
                        $inicioReserva = str_replace('0', '', $inicioReserva);
                    }

                    // Y si también terminan dentro del mes				
                    if (preg_match('/'.$anoHoy.$mesHoy.'/i', $i[1])) {
                        // Seteamos la fecha de fin de bloqueo con las establecidas para la reserva
                        $finReserva = str_replace($anoHoy.$mesHoy, '', $i[1]);
                        $finReserva = str_replace('T000000', '', $finReserva);							
                    }
                    else {
                        // Si la fecha de cierre es posterior al mes vigente seteamos como fecha de cierre el último día del mes
                        $finReserva = $diasMes+1; // El script tiene un bug que carga un día menos en cada reserva que se sale del mes vigente, así que sumamos +1 en esta variable para que cargue el período completo para reservas que se salen del mes vigente.										 
                    }
                }
                else {
                    // Si la fecha de inicio no coincide con el mes vigente seteamos la fecha al primer día del mes
                    $inicioReserva = 1;	

                    // Si la fecha de cierre coincide con el mes vigente
                    if (preg_match('/'.$anoHoy.$mesHoy.'/i', $i[1])) {
                        // Seteamos la fecha de fin de bloqueo con las establecidas para la reserva
                        $finReserva = str_replace($anoHoy.$mesHoy, '', $i[1]);
                        $finReserva = str_replace('T000000', '', $finReserva);	
                    }
                    else {
                        // Si la fecha de cierre es posterior al mes vigente seteamos como fecha de cierre el último día del mes
                        $finReserva = $diasMes;										
                    }
                }

                // Y metemos cada día bloqueado en un array			
                for($cont = $inicioReserva; $cont < $finReserva; $cont++) {
                    $diasBloqueados[] = $cont;
                }	
            }
        }	

        return $diasBloqueados;
    }

    function mostrarTitulosWidget($mesesAno, $mesHoy, $anoHoy, $diasSemana, $lang) {
        $cont = 0;

        echo '<span class="calendar-title"><h2>'.$mesesAno[$mesHoy][$lang].' '.$anoHoy.'</h2></span>
              <table class="calendar" style="width:100%">
                <tr>';

        for($cont = 0; $cont < 7; $cont++) {
                echo '<th>'.$diasSemana[$cont][$lang].'</th>';
        }

        echo '  </tr>';
    }

    function mostrarCalendario($diasSemana, $diaHoy, $diaSemanaPrimeroMes, $diasMes, $diasBloqueados) {
        $cont = 0; // Máximo 6 y se resetea
        $dia = 1;
        $start = false;
        $end = false;
        $last = false;
        $class = '';

        while (!$end) {
                if ($cont == 0) {
                        echo '<tr>';
                }

                if ($dia == $diaHoy) {
                        $class = 'current';
                }
                else if ($dia < $diaHoy) {
                        $class = 'disabled';
                }
                else {
                        $class = '';
                }

                if (in_array($dia, $diasBloqueados)) {
                        $class .= ' locked';
                }

                echo '<td class="'.$class.'"><span>';
                if (!$start) {
                        if ($diasSemana[$cont]['en'] == $diaSemanaPrimeroMes) {
                                $start = true;
                                echo $dia;
                                $dia++;
                        }
                }
                else {
                        if ($dia <= $diasMes) {
                                echo $dia;
                                $dia++;	
                        }
                        else {
                                $last = true;
                        }
                }
                echo '</span></td>';

                $cont++;

                if ($cont > 6) {
                        if (!$last) {
                                $cont = 0;
                                echo '</tr>';	
                        }
                        else {
                                $end = true;
                        }
                }
        }
        echo '</table>';
    }
?>