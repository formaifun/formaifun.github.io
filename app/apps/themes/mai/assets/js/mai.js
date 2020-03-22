$(window).on("scroll", function() {
    $(".header nav").toggleClass("shrink", $(this).scrollTop() > 50)
});