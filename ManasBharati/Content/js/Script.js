$(document).ready(function () {

    setTimeout(function () { $("#messagediv").hide(); }, 6000);

    $('[data-toggle="tooltip"]').tooltip();
    $('[data-toggle="popover"]').popover();

    //Back to top
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('#scroll').fadeIn();
        } else {
            $('#scroll').fadeOut();
        }
    });
    $('#scroll').click(function () {
        $("html, body").animate({ scrollTop: 0 }, 600);
        return false;
    });

});     

$(function () {
    'use strict'

    $('[data-toggle="offcanvas"]').on('click', function () {
        $('.offcanvas-collapse').toggleClass('open')
    })

    new WOW().init();    

});



function loading(e) {
    var div = document.createElement('div');
    var img = document.createElement('img');
    img.src = 'http://www.ipsnawada.com/Content/images/loader.gif';
    img.style.cssText = 'height:100px;width:100px; border-radius:50%;background: transparent; top:25%; position:absolute';
    div.style.cssText = 'display: flex;justify-content: center;position:fixed;z-index:2300;top:0%;width: 100%; height:100%;background: rgba(0,0,0,0.4);overflow:hidden !important';
    div.appendChild(img);
    document.body.appendChild(div);
    return true;
    // These 2 lines cancel form submission, so only use if needed.
        //window.event.cancelBubble = true;
        //e.stopPropagation();
}

$(".custom-file-input").on("change", function () {
    var fileName = $(this).val().split("\\").pop();
    $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});




$(function () {
    $("#checkboxpresentaddress").click(function () {
       
        if ($(this).is(":checked")) {
            $("#permanentaddress").attr("disabled", "disabled");

            $('#permanentaddress').val($('#presentaddress').val());
            
        }

        else {

            $('#permanentaddress').val('');
            $("#permanentaddress").removeAttr("disabled");
            $("#permanentaddress").focus();
            
        }

        $('#presentaddress').on("keyup", function () {
            if ($('#checkboxpresentaddress').is(":checked")) {
                $('#permanentaddress').val($('#presentaddress').val());
            }
        });

        
    });
});

// Tawk

        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
        s1.async=true;
        s1.src='https://embed.tawk.to/5d514cbc77aa790be32e84c3/default';
        s1.charset='UTF-8';
        s1.setAttribute('crossorigin','*');
        s0.parentNode.insertBefore(s1,s0);
        })();





