class Public::ShippingAddressesController < ApplicationController
  before_action :authenticate_saunner!

  def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = current_saunner.shipping_addresses.all
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.saunner_id = current_saunner.id
    if @shipping_address.save
      redirect_to shipping_addresses_path, notice: "配送先住所を登録しました"
    else
      @shipping_address = current_saunner.shipping_addresses.all
      render 'index'
    end
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      redirect_to shipping_addresses_path, notice: "配送先を編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.destroy
      redirect_to shipping_addresses_path, notice: "配送先住所を削除しました"
    end
  end


  private

  def shipping_address_params
    params.require(:shipping_address).permit(:postcode, :address, :name, :saunner_id)
  end


end
