(function (root, $) {
    var $button = $('button.nav'),
        $nav = $('.side ul');

    $('.js').show();
    $('.no-js').hide();

    $button.on('click', function () {
        $nav.slideToggle();
    });
}(window, jQuery));
