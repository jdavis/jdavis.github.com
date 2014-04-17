(function (root, $) {
    var $button = $('button.nav'),
        $nav = $('.side ul');

    $('.js-mobile').show();
    $('.no-js-mobile').hide();

    $button.on('click', function () {
        $nav.slideToggle();
    });
}(window, jQuery));
