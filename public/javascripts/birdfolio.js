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
});
