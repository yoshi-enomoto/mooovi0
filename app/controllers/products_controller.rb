# class ProductsController < ApplicationController
class ProductsController < RankingController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end
end
