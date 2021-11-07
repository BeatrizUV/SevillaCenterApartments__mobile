// Slider de la p�gina de apartamentos
$(document).ready(function() {     
    /**
     * Autoajuste del height de las im�genes del slider para que todas se vean igual.
     */
    $('#gallery-slider #first').load(function() {
        var sliderHeight = $('#gallery-slider').height();
        var sliderBorderTop = parseInt($('#gallery-slider').css('border-top-width').replace('px', ''));
        var sliderBorderBottom = parseInt($('#gallery-slider').css('border-bottom-width').replace('px', ''));
        $('#gallery-slider img').height(sliderHeight - (sliderBorderTop + sliderBorderBottom)); 
    });
    
    /**
     * Funci�n que mueve el carrusel de fotos hacia la izquierda.
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
     * Funci�n que mueve el carrusel de fotos hacia la derecha.
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
     * Funci�n que obtiene el width del slider
     */
    $.fn.getInterval = function() {
        return $('#gallery-slider').width() + parseInt($('#gallery-slider').css('border-left').replace('px', ''));
    };    
    
    /**
     * Funci�n que sombrea el bot�n del slider que no pueda seguir activ�ndose 
     * por llegar los l�mites del slider.
     */
    $.fn.checkSliderControlButtons = function(currentMarginLeft, maxMargin, interval) {
        if (maxMargin === 0) {
            // Acciones bot�n izquierdo
            if ((currentMarginLeft + interval) < maxMargin) {
                // bot�n derecho activado
                $('#slider-right').removeClass('slider-control-disabled');
            }
            else {
                // bot�n izquierdo desactivado
                $('#slider-left').addClass('slider-control-disabled');
            }
        }
        else {
            // Acciones bot�n derecho
            if ((currentMarginLeft - interval) > maxMargin) {
                // bot�n izquierdo activado
                $('#slider-left').removeClass('slider-control-disabled');
            }
            else {
                // bot�n derecho desactivado
                $('#slider-right').addClass('slider-control-disabled');
            }
        }
    };
});

$(document).on("pagehide","#booking-engine",function() {
    $('#apartments #apartments-button-menu').addClass('ui-btn-active');
});
