// うまく読み込まれていない
$(function() {
  alert("aaa");
    var count = 20;
 $('.text_overflow').each(function() {
     var thisText = $(this).text();
      var textLength = thisText.length;
       if (textLength > count) {
            var showText = thisText.substring(0, count);
            var hideText = thisText.substring(count, textLength);
           var insertText = showText;
          insertText += '<span class="hide">' + hideText + '</span>';
           insertText += '<span class="omit">…</span>';
            insertText += '<a href="" class="more">もっと見る</a>';
            $(this).html(insertText);
       };
  });
 $('.text_overflow .hide').hide();
 $('.text_overflow .more').click(function() {
      $(this).hide()
          .prev('.omit').hide()
         .prev('.hide').fadeIn();
      return false;
   });
});
