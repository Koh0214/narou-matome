// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(function() {
    var count = 100;
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
