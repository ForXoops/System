
$(function () {
  var url = window.location;

  // for sidebar menu entirely but not cover treeview
  $('ul.nav-sidebar a').filter(function() {
      return this.href == url;
  }).addClass('active');
  
  // for treeview
  $('ul.nav-treeview a').filter(function() {
      return this.href == url;
  }).parentsUntil(".nav-sidebar > .nav-treeview").addClass('menu-open').prev('a').addClass('active');

    if($(".errorMsg").length > 0){
        setTimeout(function(){
            $(".errorMsg").slideUp(500, function(){
                $(this).next().remove();
                $(this).remove();
            });
        }, 7000);
    }
    
    $('[data-toggle="tooltip"]').tooltip();

    $(".help-view").click(function () {
      $("div#xo-system-help").slideToggle(1000);
      $("help-view").toggle();
      $("help-hide").toggle();
    });

    $(".help-hide").click(function () {
      $("div#xo-system-help").slideToggle(1000);
      $(".help-view").toggle();
      $(".help-hide").toggle();
    });
})