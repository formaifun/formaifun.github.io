'use strict';

function slider() {
    $('.item-bg').each(function() {
        var image = $(this).data('bg');
        $(this).css({
            'background-image'  : 'url(' + image + ')',
            'background-size'   : 'cover',
            'background-repeat' : 'no-repeat',
            'background-position': 'center bottom'
        });
    });
    //slider auto height 
    var iit = setInterval(slide_item, 1);

    function slide_item() {
        var bh = $(window).height();
        var menu = $('.container').height();
        var h = bh - menu; 
        $('.item').height(h);
        $('.item-bg').height(h);
    }
    
    slide_item();

    var time = 7;
    var $progressBar,
        $bar,
        $elem,
        isPause,
        tick,
        percentTime;

    $('.owl-carousel').owlCarousel({
        loop: true,
        nav: true,
        dots: false,
        mouseDrag: false,
        touchDrag: false,
        items: 1,
        autoHeight: true,
        animateOut: 'fadeOut',
        animateIn: 'fadeIn',
        navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        onInitialized: progressBar,
        onTranslated: moved
    });
    
    function progressBar(){
        // build progress bar elements
        // buildProgressBar();

        // start counting
        start();
    }

    function buildProgressBar(){
        $progressBar = $("<div>",{
            id:"progressBar"
        });
        $bar = $("<div>",{
            id:"bar"
        });
        $progressBar.append($bar).prependTo($("#hero-slider"));
    }

    function start() {
        // reset timer
        percentTime = 0;
        isPause = false;
        // run interval every 0.01 second
        tick = setInterval(interval, 10);
    }

    function interval() {
        if(isPause === false){
            percentTime += 1 / time;

            $bar.css({
                width: percentTime+"%"
            });

            // if percentTime is equal or greater than 100
            if(percentTime >= 100){
                // slide to next item 
                $("#hero-slider").trigger("next.owl.carousel");
                percentTime = 0; // give the carousel at least the animation time ;)
            }
        }
    }

    function moved(){
        // clear interval
        clearTimeout(tick);
        // start again
        start();
    }
    $('.owl-nav').on( "click", function(event) {
        if (event.target.className != 'owl-nav') {
            return false ;
        }
        $('.owl-item.active a')[0].click();
        event.stopPropagation();
        return false;
    });
}

(function($) {

    slider();
})(jQuery);