class Public::SaunasController < ApplicationController
  before_action :authenticate_saunner!, only: [:new]

  def new
    @sauna = Sauna.new
  end

  def show
    @sauna = Sauna.find(params[:id])
  end

  def index
    # 公開ステータスtrueで５投稿ごとのページネーション
    @saunas = Sauna.where(is_active: true).page(params[:page]).per(5).order(created_at: :desc)
  end

  def create
    @saunner = Saunner.find_by(params[:saunner_id])
    @sauna = @saunner.saunas.new(sauna_params)
    if @sauna.save
      flash[:notice] = "施設登録申請に成功しました。表示されるまでもう少しお待ちくださいませ。"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def sauna_params
    params.require(:sauna).permit(:post_id, :name, :store_type, :target, :swap, :prefecture, :postcode, :address, :tel, :hp, :access, :holiday, :open, :fee, :stove, :heat_source, :sauna_temperature, :sauna_capacity, :tv, :complement, :mizu_temperature, :mizu_capacity, :depth, :vibra, :mizu_complement, :break_space, :air_bath, :chair, :chair_quantity, :aufguss, :aufguss_frequency, :auto_loyly, :auto_loyly_frequency, :self_loyly, :inside_break_space, :wi_fi, :supply, :work_space, :restaurant, :parking, :dispenser, :oropo, :tattoo, :shampoo, :conditioner, :bodysoap, :facesoap, :razor, :toothbrush, :nylon_towell, :hairdryer, :facetowell, :bathtowell, :pants, :saunamat, :saunaboard, :free_text)
  end
end
