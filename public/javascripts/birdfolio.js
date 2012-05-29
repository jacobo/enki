$(document).ready(function() {
  $('.works_nav a').pjax();
  $(".defaultText").focus(function()
  {
      if ($(this).val() == $(this)[0].title)
      {
          $(this).removeClass("defaultTextActive");
          $(this).val("");
      }
  });
  $(".defaultText").blur(function()
  {
      if ($(this).val() == "")
      {
          $(this).addClass("defaultTextActive");
          $(this).val($(this)[0].title);
      }
  });
  $(".defaultText").blur();
  var fixpreviousnext = function(){
    var index = $("ul.work_image_nav li a").index($("ul.work_image_nav li a.current"));
    if(index < ($("ul.work_image_nav li a").length - 1)){
      $(".previousnext a.next").removeClass("disabled");
    }else{
      $(".previousnext a.next").addClass("disabled");
    }
    if(index > 0){
      $(".previousnext a.previous").removeClass("disabled");
    }else{
      $(".previousnext a.previous").addClass("disabled");
    }
  }
  $("ul.work_image_nav li a").live("click", function(){ 
    var to_show = $(this);
    var to_show_image = $("#" + to_show.data("image"));
    var to_hide = $("ul.work_image_nav li a.current");
    var to_hide_image = $("#" + to_hide.data("image"));
    to_hide.removeClass("current");
    to_show.addClass("current");
    to_hide_image.hide();
    to_show_image.show();
    fixpreviousnext();
    return false;
  });
  $(".previousnext a.previous").live("click", function(){
    var index = $("ul.work_image_nav li a").index($("ul.work_image_nav li a.current"));
    if(index > 0){
      $($("ul.work_image_nav li a")[index - 1]).click();
    }
    return false;
  });
  $(".previousnext a.next").live("click", function(){
    var index = $("ul.work_image_nav li a").index($("ul.work_image_nav li a.current"));
    if(index < ($("ul.work_image_nav li a").length - 1)){
      $($("ul.work_image_nav li a")[index + 1]).click();
    }
    return false;
  });
});
