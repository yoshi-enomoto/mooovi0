class RankingController < ApplicationController
  layout 'mooovi'
  #『layout』で記載することで、
  #  そのコントローラでのアクションが呼ばれたあと表示するビューの
  #  レイアウトファイルを指定できる。
  #『application.html.haml』の設定を上書きし、『mooovi.html.haml』を適用可能。
  before_action :ranking
  def ranking
    # @ranking = Product.limit(5)
    # 投稿数の多い順に修正
    product_ids = Review.group(:product_id).order("count_product_id DESC").limit(5).count(:product_id).keys
    # Review.group(:product_id)：引数に指定したカラム名で、値の同じレコードをまとめる
    # .order("count_product_id DESC").limit(5)：まとまりの数が多い順に、上位５個を表示
    # .count(:product_id)：上記で、抽出したカラム名でソートがかけられるように、引数を設定
    # .keys：ハッシュのキーのみを配列で返す。
    # ->結果、まとまり数が多い順のidが取り出せる。

    # 上位５件のレコード取得
    @ranking = product_ids.map { |id| Product.find(id) }
    # @ranking = Product.find(product_ids) / = Product.where(id: product_ids)では
    # レコードがid順になってしまう為、mapメソッド を用いて順番に取り出し、処理を施したのちに格納させる。
  end
end
