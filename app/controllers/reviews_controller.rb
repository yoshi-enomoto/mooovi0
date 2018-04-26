# class ReviewsController < ApplicationController
class ReviewsController < RankingController
  # 『new』アクション発動時、ログインしているかを確認して、リダイレクトの要否を判定。
  before_action :authenticate_user!, only: :new

  def new
    @review = Review.new
    @product = Product.find(params[:product_id])
    # ↑URL内に記載されているkey名で渡される為
    #『/products/:product_id/reviews/new(.:format)』
  end

  def create
    # 下記の記述で１行。（パラメータで送られてくるものをモデルインスタンスとして生成＆保存）
    Review.create(review_params)
      # 下記の２行記述は生成、そして保存の流れ。
      # パラメータでインスタンス変数を生成。その後、それを保存。
      # @review = Review.new(review_params)
      # @review.save
    redirect_to controller: "products", action: "index"
      # リダイレクトの方法は、下記でも可能。
      # redirect_to controller: :products, action: :index

  end

  private
  def review_params
    # アソシエーション&foreign_keyを設定していても、『merge』メソッドは必要！
      # params.require(:review).permit(:rate, :review).merge(product_id: params[:product_id])
    # reviewsテーブルにuser_idカラム追加後
    params.require(:review).permit(:rate, :review).merge(product_id: params[:product_id], user_id: current_user.id)
  end
end
