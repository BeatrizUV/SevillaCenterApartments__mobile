// Slider de la página de apartamentos
$(document).ready(function() {     
    /**
     * Autoajuste del height de las imágenes del slider para que todas se vean igual.
     */
    $('#gallery-slider #first').load(function() {
        var sliderHeight = $('#gallery-slider').height();
        var sliderBorderTop = parseInt($('#gallery-slider').css('border-top-width').replace('px', ''));
        var sliderBorderBottom = parseInt($('#gallery-slider').css('border-bottom-width').replace('px', ''));
        $('#gallery-slider img').height(sliderHeight - (sliderBorderTop + sliderBorderBottom)); 
    });
    
    /**
     * Función que mueve el carrusel de fotos hacia la izquierda.
     */    
    $('#slider-left').click(function() {
        var interval = $('#gallery-slider').getInterval();
        var maxMargin = 0;
        var currentMarginLeft = parseInt($('#first').css('margin-left').replace('px', ''));   
        var newMarginLeft = (currentMarginLeft + interval) + 'px';   
        
        if (currentMarginLeft < maxMargin) {
            $('#first').animate({'margin-left': newMarginLeft}, 250, "linear");
        }
        
        $('#first').checkSliderControlButtons(currentMarginLeft, maxMargin, interval);
    });
    
    /**
     * Función que mueve el carrusel de fotos hacia la derecha.
     */
    $('#slider-right').click(function() {
        var interval = $('#gallery-slider').getInterval();
        var totalImages = $('#gallery-slider img').size();
        var totalWidth = interval * totalImages;
        var maxMargin = (totalWidth - interval) * -1;
        var currentMarginLeft = parseInt($('#first').css('margin-left').replace('px', '')); 
        var newMarginLeft = (currentMarginLeft - interval) + 'px';  
        
        if (currentMarginLeft > maxMargin) {
            $('#first').animate({'margin-left': newMarginLeft}, 250, "linear");
        }
        
        $('#first').checkSliderControlButtons(currentMarginLeft, maxMargin, interval);
    });
    
    // ------------------------> PLUGINS <-------------------------------- //
    
    /**
     * Función que obtiene el width del slider
     */
    $.fn.getInterval = function() {
        return $('#gallery-slider').width() + parseInt($('#gallery-slider').css('border-left').replace('px', ''));
    };    
    
    /**
     * Función que sombrea el botón del slider que no pueda seguir activándose 
     * por llegar los límites del slider.
     */
    $.fn.checkSliderControlButtons = function(currentMarginLeft, maxMargin, interval) {
        if (maxMargin === 0) {
            // Acciones botón izquierdo
            if ((currentMarginLeft + interval) < maxMargin) {
                // botón derecho activado
                $('#slider-right').removeClass('slider-control-disabled');
            }
            else {
                // botón izquierdo desactivado
                $('#slider-left').addClass('slider-control-disabled');
            }
        }
        else {
            // Acciones botón derecho
            if ((currentMarginLeft - interval) > maxMargin) {
                // botón izquierdo activado
                $('#slider-left').removeClass('slider-control-disabled');
            }
            else {
                // botón derecho desactivado
                $('#slider-right').addClass('slider-control-disabled');
            }
        }
    };
});

$(document).on("pagehide","#booking-engine",function() {
    $('#apartments #apartments-button-menu').addClass('ui-btn-active');
});
