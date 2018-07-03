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


//もっと見る機能
//https://www.tam-tam.co.jp/tipsnote/javascript/post4191.html
$(document).on('turbolinks:load',function(){
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
            insertText += '<a href="" class="more" style="color: #b2b2b2">もっと見る</a>';
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


$(document).on('turbolinks:load',function(){

  // $("#get-novel-info-button").click(function(){
  $("#modal-novel-url").change(function(){
      $.ajax({
          url: "scraping_novel",
          type: "POST",
          data: { url : $("#modal-novel-url").val()
                  },
          dataType: "html",
          success: function(data) {
              console.log('success');
              console.log(data);
              // app/views/matomes/scraping_novel.js.erb
              //上記ファイルの中身を文字列"delimiter"で分ける
              var split_datas = data.split("delimiter");
              $("#modal-novel-title").val(split_datas[0]);
              $("#modal-novel-description").val(split_datas[1]);
          },
          error: function(data) {
              console.log('error');
              alert("URLが不正、もしくはこのURLには対応していません。");
          }
      });
  });
});
