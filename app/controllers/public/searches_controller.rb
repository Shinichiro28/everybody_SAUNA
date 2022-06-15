class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    @saunas = Sauna.looks(params[:search], params[:word])
  end

end
