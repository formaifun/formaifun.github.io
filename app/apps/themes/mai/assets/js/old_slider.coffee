old_slider = ->
    return if $('.slider').length == 0
    $progressBar = undefined
    $bar = undefined
    $elem = undefined
    $isPause = undefined
    $tick = undefined
    $percentTime = undefined
    slide_item = ->
        bh = $(window).height()
        menu = $('.container.header').height()
        footer = $('.footer').height()
        h = bh - menu - footer
        $('.item').height h
        $('.item-bg').height h

    progressBar = ->
        # build progress bar elements
        # buildProgressBar();
        # start counting
        start()

    buildProgressBar = ->
        $progressBar = $('<div>', id: 'progressBar')
        $bar = $('<div>', id: 'bar')
        $progressBar.append($bar).prependTo $('#hero-slider')

    start = ->
        # reset timer
        $percentTime = 0
        $isPause = false
        # run interval every 0.01 second
        $tick = setInterval(interval, 10)

    interval = ->
        if $isPause == false
            $percentTime += 1 / $time
            # $bar.css({
            #     width: percentTime+"%"
            # });
            # if percentTime is equal or greater than 100
            if $percentTime >= 100
                # slide to next item 
                $('#hero-slider').trigger 'next.owl.carousel'
                $percentTime = 0
        # give the carousel at least the animation time ;)

    moved = ->
        # clear interval
        clearTimeout $tick
        # start again
        start()
    
    $('.item-bg').each ->
        image = $(this).data('bg')
        $(this).css
            'background-image': "url(#{image })"
            'background-size': 'cover'
            'background-repeat': 'no-repeat'
            'background-position': 'center bottom'
        return
    #slider auto height 
    $iit = setInterval(slide_item, 4)
    slide_item()
    $time = 7
    
    $('.owl-carousel').owlCarousel
        loop: true
        nav: true
        dots: true
        mouseDrag: false
        touchDrag: false
        items: 1
        autoHeight: true
        animateOut: 'fadeOut'
        animateIn: 'fadeIn'
        navText: [
            '<i class="fa fa-angle-left"></i>'
            '<i class="fa fa-angle-right"></i>'
        ]
        onInitialized: progressBar
        onTranslated: moved
    
    $('.owl-nav').on 'click', (event) ->
        if event.target.className != 'owl-nav'
            return false
        $('.owl-item.active a')[0].click()
        event.stopPropagation()
        false
    return
$(this).on 'turbolinks:load', ->
    old_slider();    
