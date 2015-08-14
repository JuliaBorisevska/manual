$(document).ready(function() {

    $('body').append('<div id="blackout"></div>');

    var boxWidth = 480;

    function centerBox() {

        /* определяем нужные данные */
        var winWidth = $(window).width();
        if (winWidth<boxWidth){
            boxWidth=winWidth-20;
        }
        var winHeight = $(document).height();
        var scrollPos = $(window).scrollTop();

        /* Вычисляем позицию */

        var disWidth = (winWidth - boxWidth) / 2
        var disHeight = scrollPos + 150;

        /* Добавляем стили к блокам */
        $('.popup-box').css({'width' : boxWidth+'px', 'left' : disWidth+'px', 'top' : disHeight+'px'});
        $('#blackout').css({'width' : winWidth+'px', 'height' : winHeight+'px'});

        return false;
    }

    $(window).resize(centerBox);
    $(window).scroll(centerBox);
    centerBox();


    $('[class*=popup-link]').click(function(e) {
        /* Предотвращаем действия по умолчанию */
        e.preventDefault();
        e.stopPropagation();
        /* Получаем id (последний номер в имени класса ссылки) */
        var name = $(this).attr('class');
        var id = name[name.length - 1];
        var scrollPos = $(window).scrollTop();
        /* Корректный вывод popup окна, накрытие тенью, предотвращение скроллинга */
        $('#popup-box-'+id).show();
        $('#blackout').show();
        $('html,body').css('overflow', 'hidden');
        /* Убираем баг в Firefox */
        $('html').scrollTop(scrollPos);

        if (id=="1"){
            $('#phoneOperation').val(e.target.name);
        }
        if (id=="2"){
            $('#attachOperation').val(e.target.name);
        }

    });

    $('[class*=popup-box]').click(function(e) {
        /* Предотвращаем работу ссылки, если она являеться нашим popup окном */
        e.stopPropagation();
    });
//    $('html').click(function() {
//        var scrollPos = $(window).scrollTop();
//        /* Скрыть окно, когда кликаем вне его области */
//        $('[id^=popup-box-]').hide();
//        $('#blackout').hide();
//        $("html,body").css("overflow","auto");
//        $('html').scrollTop(scrollPos);
//    });
    $('.close').click(function() {
        var scrollPos = $(window).scrollTop();
        /* Скрываем тень и окно, когда пользователь кликнул по X */
        $('[id^=popup-box-]').hide();
        $('#blackout').hide();
        $("html,body").css("overflow","auto");
        $('html').scrollTop(scrollPos);
    });

    $('#phone-save-btn').click(function(e) {
        var scrollPos = $(window).scrollTop();
        $('[id^=popup-box-]').hide();
        $('#blackout').hide();
        $("html,body").css("overflow","auto");
        $('html').scrollTop(scrollPos);

        var operation=$('#phoneOperation').val();
        var country=$('#countryCode').val();
        var operator=$('#operatorCode').val();
        var number=$('#basicNumber').val();
        var type=$('#phoneType').val();
        var comment=$('#userComment').val();

        if (operation=="add"){
            $("#phone-table").append("<tr></tr>");
            var rowCount = $('#phone-table tr').length;
            if (rowCount%2==0){
                $("#phone-table tr:last").addClass("even");
            }else{
                $("#phone-table tr:last").addClass("odd");
            }
            //$("#phone-table tr:last").append("<td>+"+country+" ("+operator+") "+number+"</td><td>"+type+"</td><td>"+comment+"</td>");
            $("#phone-table tr:last").append("<td></td>");
            $("#phone-table tr:last td").append('<a name="edit" class="popup-link-1" href="">+'+country+' ('+operator+') '+number+'</a>');
            $("#phone-table tr:last").append("<td>"+type+"</td>");
            $("#phone-table tr:last").append("<td>"+comment+"</td>");
        }



    });
});