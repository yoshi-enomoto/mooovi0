# class ProductsController < ApplicationController
class ProductsController < RankingController
  # 『search』アクション発動時、ログインしているかを確認して、リダイレクトの要否を判定。
  before_action :authenticate_user!, only: :search

  def index
    # @products = Product.all
    # 最新順に並び替えの為（新規作成されると、レコードが追加されるから）
    @products = Product.order("id DESC").limit(20)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    # Product.create(product_params)：これだけでも『create』はできる
    # バリデーション時の表示設定のため。
    @product = Product.new(product_params)
    unless @product.save
      render :new
    end
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

  private
  def product_params
    params.require(:product).permit(:title, :image_url, :director, :detail, :open_date)
  end
end
