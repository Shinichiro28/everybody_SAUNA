class Public::FavoritesController < ApplicationController

  def create
    @sauna_post_favorite = Favorite.new(saunner_id: current_saunner.id, sauna_id: params[:sauna_id], post_id: params[:post_id])
    @sauna_post_favorite.save
    redirect_to sauna_post_path(params[:sauna_id], params[:post_id])
  end

  def destroy
    @sauna_post_favorite = Favorite.find_by(saunner_id: current_saunner.id, sauna_id: params[:sauna_id], post_id: params[:post_id])
    @sauna_post_favorite.destroy
    redirect_to sauna_post_path(params[:sauna_id], params[:post_id])
  end

end
