class Admin::SaunasController < ApplicationController

  def show
    @sauna = Sauna.find(params[:id])
  end

  def index
    @saunas = Sauna.page(params[:page]).per(5).order(created_at: :desc)
  end

  def edit
    @sauna = Sauna.find(params[:id])
  end

  def update
    @sauna = Sauna.find(params[:id])
    if @sauna.update(sauna_params)
      flash[:notice] = "施設編集に成功しました。"
      redirect_to admin_path
    else
      render 'edit'
    end
  end

  private

  def sauna_params
    params.require(:sauna).permit(:post_id, :name, :store_type, :target, :swap, :prefecture, :postcode, :address, :tel, :hp, :access, :holiday, :open, :fee, :stove, :heat_source, :sauna_temperature, :sauna_capacity, :tv, :complement, :mizu_temperature, :mizu_capacity, :depth, :vibra, :mizu_complement, :break_space, :air_bath, :chair, :chair_quantity, :aufguss, :aufguss_frequency, :auto_loyly, :auto_loyly_frequency, :self_loyly, :inside_break_space, :wi_fi, :supply, :work_space, :restaurant, :parking, :dispenser, :oropo, :tattoo, :shampoo, :conditioner, :bodysoap, :facesoap, :razor, :toothbrush, :nylon_towell, :hairdryer, :facetowell, :bathtowell, :pants, :saunamat, :saunaboard, :free_text, :is_active)
  end

end
