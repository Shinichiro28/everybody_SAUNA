class Admin::CommentsController < ApplicationController

  def index
    @comments = Comment.page(params[:page]).per(14).order(created_at: :desc)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to admin_comments_path
  end

end
