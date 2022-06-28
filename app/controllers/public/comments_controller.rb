class Public::CommentsController < ApplicationController
  before_action :authenticate_saunner!

  def create
    @sauna = Sauna.find(params[:sauna_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comments = Comment.page(params[:page]).per(5)
    @comment.post_id = @post.id
    @comment.saunner_id = current_saunner.id
    @comment.sauna_id = @sauna.id
    @comment.save
    post = @comment.post
        #通知レコード
    post.create_notification_comment!(current_saunner, @comment.id)
    flash[:notice] = "コメント投稿に成功しました！"
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comments = Comment.page(params[:page]).per(5)
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
