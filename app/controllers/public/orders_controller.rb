class Public::OrdersController < ApplicationController
  before_action :authenticate_saunner!

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    @subtotal = 0
  end

  def index
    @orders = Order.page(params[:page]).per(10).order(created_at: :desc)
  end

  def create
    cart_products = current_saunner.cart_products.all
    @order = Order.new(order_params)
    if @order.save
      cart_products.each do |cart|
        order_product = OrderProduct.new
        order_product.product_id = cart.product_id
        order_product.order_id = @order.id
        order_product.quantity = cart.quantity
        order_product.price = cart.product.price
        order_product.save
      end
      redirect_to complete_path
      cart_products.destroy_all
    else
      @order = Order.new(order_params)
      render 'new'
    end
  end

  def confirm
    @order = Order.new(order_params)
    @cart_products = current_saunner.cart_products.all
    @total_price = @cart_products.inject(0) { |sum, product| sum + product.subtotal }
    @fee = 800
    @order_status = 0
    @order.shipping_fee = @fee
    @order.order_status = @order_status
    #お届け先を「登録済み住所から選択」を選んだ場合
    if params[:order][:select_address] == "0"
      unless ShippingAddress.exists?(name: params[:order][:address_id])
        @order.name = ShippingAddress.find(params[:order][:address_id]).name
        @order.postcode = ShippingAddress.find(params[:order][:address_id]).postcode
        @order.address = ShippingAddress.find(params[:order][:address_id]).address
      else
        render 'new'
        flash[:notice] = "お届け先が選択されていません"
      end
    #お届け先を「新しいお届け先」を選んだ場合
    elsif params[:order][:select_address] == "1"
    else
      render 'new'
    end
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:saunner_id, :payment_method, :postcode, :address, :name, :total_price, :shipping_fee)
  end

end
