class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
  end

  def index
    @orders = Order.page(params[:page]).per(10).order(created_at: :desc)
  end

  def update
  end

end
