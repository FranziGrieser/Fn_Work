$(function(){
  $('.pagination a').attr('data-remote', 'true')
});

/* doesn't work either
$(function () {
  $('.pagination a').live("click", function() {
    $.getScript(this.href);
    return false;
  });
});*/
