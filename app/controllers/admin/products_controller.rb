class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.page(params[:page]).per(10)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to admin_products_path
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "商品を登録しました"
      redirect_to admin_products_path
    else
      flash[:notice] = "登録に失敗しました"
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "商品を更新しました"
      redirect_to admin_products_path
    else
      flash[:notice] = "更新に失敗しました"
      render 'edit'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :introduction, :genre_id, :product_image, :price, :is_active)
  end

end
