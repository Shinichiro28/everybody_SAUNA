class Public::CommentsController < ApplicationController

  def create
    @sauna = Sauna.find(params[:sauna_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comments = Comment.page(params[:page]).per(5)
    @comment.post_id = @post.id
    @comment.saunner_id = current_saunner.id
    @comment.sauna_id = @sauna.id
    post = @comment.post
    @comment.save
        #通知レコード
    post.create_notification_comment!(current_saunner, @comment.id)
    flash[:notice] = "コメント投稿に成功しました！"
  end

  def destroy
    @sauna_post = Post.find_by(sauna_id: params[:sauna_id], id: params[:id])
    @comment = Comment.find(params[:id])
    @comments = Comment.page(params[:page]).per(5)
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
