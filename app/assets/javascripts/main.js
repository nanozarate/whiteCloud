function openDialog(){
    $("#dialog").dialog({
        width: 570,
        height: 270,
        resizable: false,
        modal: true,
        draggable: false
    });
}

function addState(elem, text){
    if(elem.val().length == 0){
        elem.addClass('initial-state').val(text);
    }
}

function removeState(elem){
    if(elem.hasClass('initial-state')){
        elem.removeClass('initial-state').val('');
    }
}

$(document).ready(function(){
    $('.link').click(function(){
        $('.active').removeClass('active');
        $(this).addClass('active');
    });

    $('.services').click(function(){
        $('#dialog>p').text($('#text-services').val());
        openDialog();
    });

    $('.tech').click(function(){
        $('#dialog>p').text($('#text-tech').val());
        openDialog();
    });
    
    $('.work').click(function(){
        $('#dialog>p').text($('#text-work').val());
        openDialog();
    });

    $('.about').click(function(){
        $('#dialog>p').text($('#text-about').val());
        openDialog();
    });

    $('.terms').click(function(){
        $('#dialog>p').text($('#text-terms').val());
        openDialog();
    });

    $('.contact-text').each(function(){
        $(this).focus(function(){
            removeState($(this));
        });
    });
    
    $('#text-name').blur(function(){
        addState($(this), "Mr. White Cloud");
    });

    $('#text-email').blur(function(){
        addState($(this), "example@whitecloud.com");
    });

    $('#text-phone').blur(function(){
        addState($(this), "555-1111");
    });

    $('#text-subject').blur(function(){
        addState($(this), "Web Design");
    });

    $('#message-area').blur(function(){
        addState($(this), "Type your message here...");
    });
});

$(function(){
    $("button").button();
});

$(function(){
    $('#slides').slides({
        preload: true,
        play: 5000,
        pause: 2500,
        hoverPause: true,
        animationStart: function(current){
            $('.caption').animate({
                bottom:-35
            }, 100);
            if (window.console && console.log) {
                console.log('animationStart on slide: ', current);
            }
        },
        animationComplete: function(current){
            $('.caption').animate({
                bottom:0
            },200);
            if (window.console && console.log) {
                console.log('animationComplete on slide: ', current);
            }
        },
        slidesLoaded: function() {
            $('.caption').animate({
                bottom:0
            },200);
        }
    });
});