class Public::FavoritesController < ApplicationController

  #非同期でリダイレクト先は削除

  def create
    @sauna = Sauna.find(params[:sauna_id])
    @post = Post.find(params[:post_id])
    @sauna_post_favorite = Favorite.new(saunner_id: current_saunner.id, sauna_id: params[:sauna_id], post_id: params[:post_id])
    @sauna_post_favorite.save

  end

  def destroy
    @sauna = Sauna.find(params[:sauna_id])
    @post = Post.find(params[:post_id])
    @sauna_post_favorite = Favorite.find_by(saunner_id: current_saunner.id, sauna_id: params[:sauna_id], post_id: params[:post_id])
    @sauna_post_favorite.destroy
  end

end
