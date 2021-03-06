$(document).ready(function() {

    $('body').append('<div id="blackout"></div>');

    var boxWidth = 480;

    function centerBox() {
        var winWidth = $(window).width();
        if (winWidth<boxWidth){
            boxWidth=winWidth-20;
        }
        var winHeight = $(document).height();
        var scrollPos = $(window).scrollTop();

        var disWidth = (winWidth - boxWidth) / 2
        var disHeight = scrollPos + 150;

        $('.popup-box').css({'width' : boxWidth+'px', 'left' : disWidth+'px', 'top' : disHeight+'px'});
        $('#blackout').css({'width' : winWidth+'px', 'height' : winHeight+'px'});
        return false;
    }

    $(window).resize(centerBox);
    $(window).scroll(centerBox);
    centerBox();

    $('.form').on('click', '[class*=popup-link]', function(e) {

        e.preventDefault();
        e.stopPropagation();

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
                $('#phoneRowNumber').val($(this).parent().parent().index());
                //var index = $(this).parent().parent().index();
                var index=$(this).parent().children('[name="index"]')[0].value;
                $('#phoneIndex').val(index);
                setFields(
                    $(this).parent().children('[id$=countryCode]')[0].value,
                    $(this).parent().children('[id$=operatorCode]')[0].value,
                    $(this).parent().children('[id$=basicNumber]')[0].value,
                    $(this).parent().children('[id$=userComment]')[0].value,
                    $(this).parent().children('[id$=phoneType]')[0].value
                );
            }
        }
        if (id=="2"){
            $('#attachOperation').val(e.target.name);
            if (e.target.name=="edit"){
                $('#attachRowNumber').val($(this).parent().parent().index());
                //var index = $(this).parent().parent().index();
                var index=$(this).parent().children('[name="attIndex"]')[0].value;
                $('#attachIndex').val(index);
                setAttachmentFields(
                    $(this).parent().children('[id$=title]')[0].value,
                    $(this).parent().children('[id$=userComment]')[0].value
                );
            }
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

    $('#attach-save-btn').click(function(e) {
        var scrollPos = $(window).scrollTop();
        $('[id^=popup-box-]').hide();
        $('#blackout').hide();
        $("html,body").css("overflow","auto");
        $('html').scrollTop(scrollPos);

        var index;
        var operation=$('#attachOperation').val();
        var title=$('#title').val();
        var comment=$('#userComment').val();
        if (operation=="add"){
            var currentDate = new Date();
            var uploads = Date.UTC(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate(),
                                    currentDate.getHours(), currentDate.getHours(), currentDate.getSeconds());
            $("#attach-table").append("<tr></tr>");
            index = $('#attach-length').val();
            $("#attach-table tr:last").append("<td></td>");
            $("#attach-table tr:last td")
                .append('<input type="hidden" name="attIndex" value="'+index+'">')
                .append('<input type="hidden" id="attachments-'+index+'-deleted" name="attachments['+index+'].deleted" value="false">')
                .append('<input type="hidden" id="attachments-'+index+'-title" name="attachments['+index+'].title" value="'+title+'">')
                .append('<input type="hidden" id="attachments-'+index+'-uploads" name="attachments['+index+'].uploads" value="'+currentDate+'">')
                .append('<input type="hidden" id="attachments-'+index+'-path" name="attachments['+index+'].path" value="newPath">')
                .append('<input type="hidden" id="attachments-'+index+'-userComment" name="attachments['+index+'].userComment" value="'+comment+'">')
                .append('<a name="edit" class="popup-link-2" href="">'+title+'</a>');
            $("#attach-table tr:last")
                .append("<td>"+currentDate.getUTCFullYear()+"-"+(currentDate.getUTCMonth()+1)+"-"+currentDate.getUTCDate()+" "+currentDate.getUTCHours()
                    +":"+currentDate.getUTCMinutes()+":"+currentDate.getUTCSeconds()+"</td>")
                .append("<td>"+comment+"</td>")
                .append('<td><input type="button" name="attachDelete" value="Удалить" id="attach-delete-btn" /></td>');
            $('#attach-length').val(parseInt(index)+1);
        }
        if (operation=="edit"){
            index=$('#attachIndex').val();
            var rowNumber = parseInt($('#attachRowNumber').val())+1;
            $("#attach-table tr:eq("+rowNumber+") td:eq(0) a").text(title);
            $("#attach-table tr:eq("+rowNumber+") td:eq(2)").text(comment);

            setAttachmentHiddenInputs(index, title, comment);

        }
        setAttachmentFields("","");

    });

    $('#phone-save-btn').click(function(e) {
        var scrollPos = $(window).scrollTop();
        $('[id^=popup-box-]').hide();
        $('#blackout').hide();
        $("html,body").css("overflow","auto");
        $('html').scrollTop(scrollPos);

        var index;
        var operation=$('#phoneOperation').val();
        var country=$('#countryCode').val();
        var operator=$('#operatorCode').val();
        var number=$('#basicNumber').val();
        var type=$('#phoneType').val();
        var comment=$('#userComment').val();
        if (operation=="add"){
            $("#phone-table").append("<tr></tr>");
            index = $('#phones-length').val();
            $("#phone-table tr:last").append("<td></td>");
            $("#phone-table tr:last td")
                .append('<input type="hidden" name="index" value="'+index+'">')
                .append('<input type="hidden" id="phones-'+index+'-deleted" name="phones['+index+'].deleted" value="false">')
                .append('<input type="hidden" id="phones-'+index+'-countryCode" name="phones['+index+'].countryCode" value="'+country+'">')
                .append('<input type="hidden" id="phones-'+index+'-operatorCode" name="phones['+index+'].operatorCode" value="'+operator+'">')
                .append('<input type="hidden" id="phones-'+index+'-basicNumber" name="phones['+index+'].basicNumber" value="'+number+'">')
                .append('<input type="hidden" id="phones-'+index+'-userComment" name="phones['+index+'].userComment" value="'+comment+'">')
                .append('<input type="hidden" id="phones-'+index+'-phoneType" name="phones['+index+'].phoneType" value="'+type+'">')
                .append('<a name="edit" class="popup-link-1" href="">+'+country+' ('+operator+') '+number+'</a>');
            $("#phone-table tr:last")
                .append("<td>"+type+"</td>")
                .append("<td>"+comment+"</td>")
                .append('<td><input type="button" name="phoneDelete" value="Удалить" id="phone-delete-btn" /></td>');
            $('#phones-length').val(parseInt(index)+1);
        }
        if (operation=="edit"){
            index=$('#phoneIndex').val();
            var rowNumber = parseInt($('#phoneRowNumber').val())+1;
            $("#phone-table tr:eq("+rowNumber+") td:eq(0) a").text(country+' ('+operator+') '+number);
            $("#phone-table tr:eq("+rowNumber+") td:eq(1)").text(type);
            $("#phone-table tr:eq("+rowNumber+") td:eq(2)").text(comment);

            setPhoneHiddenInputs(index, country, operator, number, type, comment);

        }
        setFields("","","","");

    });

    $('.form').on('click', '#attach-delete-btn', function(e) {
        //var index = $(this).parent().parent().index();
        var index=$(this).parent().parent().find('[name="attIndex"]')[0].value;
        $('#attachments-'+index+'-deleted').val("true");
        moveAttachmentHiddenInputs(index);
        $(this).parent().parent().remove();

    });

    $('.form').on('click', '#phone-delete-btn', function(e) {
        //var index = $(this).parent().parent().index();
        var index=$(this).parent().parent().find('[name="index"]')[0].value;
        $('#phones-'+index+'-deleted').val("true");
        movePhoneHiddenInputs(index);
        $(this).parent().parent().remove();

    });

    function moveAttachmentHiddenInputs(index){
        if ($('#attachments-'+index+'-id')){
            $('#attachments-'+index+'-id').insertBefore("#attach-table");
        }
        $('#attachments-'+index+'-deleted').insertBefore("#attach-table");
        $('#attachments-'+index+'-title').insertBefore("#attach-table");
        $('#attachments-'+index+'-uploads').insertBefore("#attach-table");
        $('#attachments-'+index+'-userComment').insertBefore("#attach-table");
        if ($('#attachments-'+index+'-path')){
            $('#attachments-'+index+'-path').insertBefore("#attach-table");
        }
    }

    function movePhoneHiddenInputs(index){
        if ($('#phones-'+index+'-id')){
            $('#phones-'+index+'-id').insertBefore("#phone-table");
        }
        $('#phones-'+index+'-deleted').insertBefore("#phone-table");
        $('#phones-'+index+'-countryCode').insertBefore("#phone-table");
        $('#phones-'+index+'-operatorCode').insertBefore("#phone-table");
        $('#phones-'+index+'-basicNumber').insertBefore("#phone-table");
        $('#phones-'+index+'-userComment').insertBefore("#phone-table");
        $('#phones-'+index+'-phoneType').insertBefore("#phone-table");
    }

    function setAttachmentHiddenInputs(index, title, comment){
        $('#attachments-'+index+'-title').val(title);
        $('#attachments-'+index+'-userComment').val(comment);
    }

    function setAttachmentFields(title, comment) {

        $('#title').val(title);
        $('#userComment').val(comment);

    }

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