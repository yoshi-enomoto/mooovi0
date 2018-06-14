$(document).on("turbolinks:load", function() {

  $("#search_directors").on("keyup", function() {
    var input = $("#search_directors").val();
    var url = $(this).parent().attr("action");
    console.log(url);
    console.log(input);

  });
});
