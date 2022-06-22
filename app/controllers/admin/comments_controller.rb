class Admin::CommentsController < ApplicationController

  def index
    @saunner = Saunner.find_by(params[:saunner_id])
    @sauna = Sauna.find_by(params[:sauna_id])
    @post = Post.find_by(params[:post_id])
    @comments = Comment.all
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to admin_comments_path
  end

end
