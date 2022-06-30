class Admin::SaunnersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @saunner = Saunner.find(params[:id])
  end

  def index
    @saunners = Saunner.page(params[:page]).per(5).order(created_at: :desc)
  end

  def edit
    @saunner =Saunner.find(params[:id])
  end

  def update
    @saunner = Saunner.find(params[:id])
    if @saunner.update(saunner_params)
      flash[:notice] = "会員情報の更新に成功しました。"
      redirect_to admin_saunner_path(@saunner.id)
    else
      render "edit"
    end
  end

  private

  def saunner_params
    params.require(:saunner).permit(:first_name, :last_name, :email, :nickname, :is_deleted)
  end

end
