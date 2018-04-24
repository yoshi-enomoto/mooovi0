class Product < ActiveRecord::Base

  has_many  :reviews

  def review_average
    reviews.average(:rate).round
    # self.reviews.average(:rate).round：上記の略さず記載の形
      # 『self』を用いたのは、インスタンス変数productをそのまま記載するとエラーになる為。
      # レシーバ（メソッドを使用したインスタンス自体の事）に対して適用することが出来る。
  end
end
