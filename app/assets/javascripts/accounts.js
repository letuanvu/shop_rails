//= require jquery
//= require jquery_ujs
//= require bootstrap/js/bootstrap.js
//= require iCheck/icheck.min

$(function () {
    $('input').iCheck({
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue',
        increaseArea: '20%' // optional
    });
});
