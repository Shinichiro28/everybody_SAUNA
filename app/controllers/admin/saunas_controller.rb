class Admin::SaunasController < ApplicationController

  def show
    @sauna = Sauna.find(params[:id])
  end

  def index
    @saunas = Sauna.all
  end

  def edit
    @sauna = Sauna.find(params[:id])
    if @sauna.update
      flash[:notice] = "施設編集に成功しました。"
      redirect_to admin_path
    else
      render 'edit'
    end
  end

end
