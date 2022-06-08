class Public::SaunasController < ApplicationController

  def new
    @sauna = Sauna.new
  end

  def show
    @sauna = Sauna.find(params[:id])
  end

  def index
    @saunas = Sauna.all
  end

  def edit
  end

  def create
    @sauna = Sauna.new(sauna_params)
    if @sauna.save
      flash[:notice] = "施設登録申請に成功しました。表示されるまでもう少しお待ちくださいませ。"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private

  def sauna_params
    params.require(:sauna).permit(:name, :store_type, :target, :swap, :prefecture, :postcode, :address, :tel, :hp, :access, :holiday, :open, :fee, :stove, :heat_source, :sauna_temperature, :sauna_capacity, :tv, :complement, :mizu_temperature, :mizu_capacity, :depth, :vibra, :break_space, :air_bath, :chair, :chair_quantity, :aufguss, :aufguss_frequency, :auto_loyly, :auto_loyly_frequency, :self_loyly, :inside_break_space, :wi_fi, :supply, :work_space, :restaurant, :parking, :dispenser, :oropo, :tattoo, :shampoo, :conditioner, :bodysoap, :facesoap, :razor, :toothbrush, :nylon_towell, :hairdryer, :facetowell, :bathtowell, :pants, :saunamat, :saunaboard, :free_text)
  end

end
