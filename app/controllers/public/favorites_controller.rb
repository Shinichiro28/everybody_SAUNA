class Public::FavoritesController < ApplicationController

  #非同期でリダイレクト先は削除
  def create
    @sauna = Sauna.find(params[:sauna_id])
    @post = Post.find(params[:post_id])
    favorite = @post.favorites.new(sauna_id: params[:sauna_id], saunner_id: current_saunner.id)
    favorite.save
      #通知レコード
    @post.create_notification_favorite!(current_saunner)
  end

  def destroy
    @sauna = Sauna.find(params[:sauna_id])
    @post = Post.find(params[:post_id])
    favorite = @post.favorites.find_by(sauna_id: params[:sauna_id], saunner_id: current_saunner.id)
    favorite.destroy
  end

end
