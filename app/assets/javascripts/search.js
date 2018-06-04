$(function() {
  $(".search__query").on("keyup",function() {
    // 対象クラスに文字が入力されたら、その文字を変数へ代入する。
    var input = $(".search__query").val();
    var url = $(this).attr("action");

    $.ajax({
      type: "get",
      url: url,
      // キー『name属性』、バリュー『上記の変数input』
      data: { keyword: input },
      dataType: "json"
    })

  });
});
