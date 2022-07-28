class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    @subtotal = 0
  end

  def index
    @orders = Order.page(params[:page]).per(10).order(created_at: :desc)
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.order_products.update_all(production_status: 1)
      @order.order_products == "waiting"
    end
    flash[:notice] = "更新完了しました"
    redirect_to request.referer
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
