class Public::SearchesController < ApplicationController
  before_action :authenticate_saunner!

  def search
    @range = params[:range]
    @saunas = Sauna.looks(params[:search], params[:word])
  end

end
