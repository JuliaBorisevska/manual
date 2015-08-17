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

    $('.form').on('click', '[class*=popup-link]', function(e) {
        /* Предотвращаем действия по умолчанию */
        //console.log($(this).parent().parent().index());
        var index = $(this).parent().parent().index();
        $('#index').val(index);
        //console.log($(this).parent()[0].tagName);
        //console.log($(this).parent().children('[id$=id]')[0].value);
        //console.log($(this).parent().children('[id$=countryCode]')[0].value);
        //console.log($(this).parent().children('#phones-0-operatorCode')[0].value);
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
            if (e.target.name=="edit"){
                setFields(
                    $(this).parent().children('#phones-'+index+'-countryCode')[0].value,
                    $(this).parent().children('#phones-'+index+'-operatorCode')[0].value,
                    $(this).parent().children('[id$=basicNumber]')[0].value,
                    $(this).parent().children('[id$=userComment]')[0].value,
                    $(this).parent().children('[id$=phoneType]')[0].value
                );
            }

        }
        if (id=="2"){
            $('#attachOperation').val(e.target.name);
        }

    });

    $('[class*=popup-box]').click(function(e) {
        /* Предотвращаем работу ссылки, если она являеться popup окном */
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
        setFields("","","","");
    });

    $('#phone-save-btn').click(function(e) {
        var scrollPos = $(window).scrollTop();
        $('[id^=popup-box-]').hide();
        $('#blackout').hide();
        $("html,body").css("overflow","auto");
        $('html').scrollTop(scrollPos);

        var index=parseInt($('#index').val())+1;
        console.log(index);
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
        if (operation=="edit"){
            $("#phone-table tr:eq("+index+") td:eq(0) a").text(country+' ('+operator+') '+number);
            $("#phone-table tr:eq("+index+") td:eq(1)").text(type);
            $("#phone-table tr:eq("+index+") td:eq(2)").text(comment);
            setPhoneHiddenInputs($('#index').val(), country, operator, number, type, comment);

        }
        setFields("","","","");

    });

    function setPhoneHiddenInputs(index, country, operator, number, type, comment){
        $('#phones-'+index+'-countryCode').val(country);
        $('#phones-'+index+'-operatorCode').val(operator);
        $('#phones-'+index+'-basicNumber').val(number);
        $('#phones-'+index+'-userComment').val(comment);
        $('#phones-'+index+'-phoneType').val(type);
    }

    function setFields(country, operator, number, comment, type) {

        $('#countryCode').val(country);
        $('#operatorCode').val(operator);
        $('#basicNumber').val(number);
        $('#userComment').val(comment);
        if (type){
            $('#phoneType').val(type);
        }
    }

});