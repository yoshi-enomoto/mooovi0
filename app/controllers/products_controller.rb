# class ProductsController < ApplicationController
class ProductsController < RankingController
  def index
    # @products = Product.all
    # 最新順に並び替えの為（新規作成されると、レコードが追加されるから）
    @products = Product.order("id DESC").limit(20)
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    #『like句』をwhereメソッドと共に使用。
    #『（カラム名: バリュー）と記述して、レコードを取得』『where(user_id: @user.id)』

    #下記の場合
    # 前者："検索するカラム名 LIKE(?)"（書き方固定）
    # 後者："検索するキーワード"
    #      params内（URLで送られてくる）のkey『keyword』に対応するバリューに
    #      曖昧文字列（%）を付ける＝『〜バリュー〜』（値）
    @products = Product.where("title LIKE(?)", "%#{params[:keyword]}%").limit(20)
  end
end
