slider = ->
  return if $('.swiper-container').length == 0
  new Swiper('.swiper-container', {
    slidesPerView: 1
    loop: true,
    spaceBetween: 30
    effect: 'fade'
    preventClicks: false
    preventClicksPropagation: false
    pagination: {
      el: '.swiper-pagination',
      clickable: true,
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  })
$(this).on 'turbolinks:load', ->
  slider()    