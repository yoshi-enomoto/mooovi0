$(document).on("turbolinks:load", function() {
// $(function() {

  // htmlを差し込む要素名を変数定義
  var search_list = $(".listview.js-lazy-load-images");

  // 配列型に情報がある場合は、一つずつが引数に渡される。
  function appendProduct(product) {
    var html = `<li>
                  <a class="listview__element--right-icon" href="/products/${product.id}/reviews/new" title="${product.title}">
                    <div class="position-right p1em">
                      <i class="icon-chevron-right color-sub">
                      </i>
                    </div>
                    <div class="row no-space-bottom">
                      <div class="col2">
                        <div class="thumbnail thumbnail--movies">
                          <div class="thumbnail__figure" style="background-image:url(${product.image});" title="${product.title}">
                          </div>
                        </div>
                      </div>
                      <div class="col6 push6">
                        <h3 class="text-middle text-break">
                          <span class="color-sub">
                          ${product.title}
                          </span>
                          <p class="text-xsmall text-overflow">
                          ${product.detail}
                          </p>
                        </h3>
                      </div>
                    </div>
                  </a>
                </li>`
    // 今まで、本処理内でappend（html要素の追加）していたものを関数内に置く。
    search_list.append(html);
  }

  // 配列型に情報がない場合は、『else』で設定した引数が渡される。
  function appendNoProduct(product) {
    var html = `<li>
                  <div class="listview__element--right-icon">
                  ${product}
                  </div>
                </li>`
    // 今まで、本処理内でappend（html要素の追加）していたものを関数内に置く。
    search_list.append(html);
  }

  $("#search_products").on("keyup",function() {
    // 対象クラスに文字が入力されたら、その文字を変数へ代入する。
    var input = $("#search_products").val();
    var url = $(this).parent().attr("action");
    console.log(url);
    console.log(input);

    $.ajax({
      type: "get",
      url: url,
      // キー『name属性』、バリュー『上記の変数input』
      data: { keyword: input },
      dataType: "json"
    })

    // 引数は配列型なので複数形
    .done(function(products) {
      // 検索文字入力時、その前の検索結果を削除する。
      $(".listview.js-lazy-load-images").empty();
      // 配列型の中身の有・無により、差し込む引数（ビュー）を変える。
      if (products.length !== 0){
        // サーバーから返ってきた配列型に対して、１つずつの要素を取り出して{}内の処理を行う。
        products.forEach(function(product){
          appendProduct(product);
        });
      }
      else {
        appendNoProduct("一致する映画はありません");
      }
    })
    .fail(function() {
      alert("映画検索に失敗しました");
    })

  });
});
