$(document).ready(function() {
    
    $(function() {
        $('#cookies-alert').checkCookies(); 
    });
    
    $('#cookies-alert .ui-icon-delete').click(function() {
        $(location).attr('href', 'http://www.google.com');
    });
    
    $('#cookies-alert-btn').click(function() {
        $('#cookies-alert').closeCookieDialog();
    });
    
    $.fn.closeCookieDialog = function() {
        $('#cookies-alert').css('display', 'none');
        $.cookie('cookies', 'si', { expires: 7, path: '/' });
        $('#cookies-alert').checkCookies();
    };
    
    /**
     * Plugin que muestra o esconde el aviso de cookies.
     * @returns {undefined}
     */
    $.fn.checkCookies = function() {
        // Para este plugin utilizamos el plugin jquery.cookies.js descargable desde internet
        if ($.cookie('cookies') === 'si') {
            $('#cookies-alert').remove();
        }
        else {
            $('#cookies-alert').animate({'bottom': '0'}, 1000);
        }
    }
});
