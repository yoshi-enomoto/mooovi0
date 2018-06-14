$(document).on("turbolinks:load", function() {

  $("#search_directors").on("keyup", function() {
    var input = $("#search_directors").val();
    var url = $(this).parent().attr("action");
    console.log(url);
    console.log(input);

    $.ajax({
      type: "get",
      url: url,
      data: {keyword_director: input},
      dataType: "json"
    })
    .done(function(products) {
      $(".listview.js-lazy-load-images").empty();

      if (products.length !== 0){
        products.forEach(function(product){
          appendProduct(product);
        });
      }
      else {
          appendNoProduct("一致する監督名の映画はありません");
      }
    })
    .fail(function(){
        alert("映画検索に失敗しました");
    })

  });
});
