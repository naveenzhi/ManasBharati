$(document).ready(function () {

    

    $('[data-toggle="tooltip"]').tooltip();
    $('[data-toggle="popover"]').popover();

    setTimeout(function () { $("#messagediv").hide(); }, 6000);
});
$(function () {
    'use strict'

    $('[data-toggle="offcanvas"]').on('click', function () {
        $('.offcanvas-collapse').toggleClass('open')
    })
    new WOW().init();    

});



function loading() {
    var div = document.createElement('div');
    var img = document.createElement('img');
    img.src = 'http://www.ipsnawada.com/Content/images/loader.gif';
    img.style.cssText = 'height:100px;width:100px; border-radius:50%;background: transparent; top:25%; position:absolute';
    div.style.cssText = 'display: flex;justify-content: center;position:fixed;z-index:2300;top:0%;width: 100%; height:100%;background: rgba(255,255,255,0.7);overflow:hidden !important';
    div.appendChild(img);
    document.body.appendChild(div);
}




$(".custom-file-input").on("change", function () {
    var fileName = $(this).val().split("\\").pop();
    $(this).siblings(".custom-file-label").addClass("selected").html(fileName);

});