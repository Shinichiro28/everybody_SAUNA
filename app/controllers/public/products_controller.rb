class Public::ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @genres = Genre.all
    @cart_product = CartProduct.new
  end

  def index
    @genres = Genre.all
    @products = params[:name].present? ? Genre.find(params[:name]).products.page(params[:page]).per(8).order(created_at: :desc) : Product.page(params[:page]).per(8).order(created_at: :desc)
  end
end
