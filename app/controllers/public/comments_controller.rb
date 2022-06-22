class Public::CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post_id = @post.id
    @comment.saunner_id = current_saunner.id
    post = @comment.post
    if @comment.save
        #通知レコード
      post.create_notification_comment!(current_saunner, @comment.id)
      flash[:notice] = "コメント投稿に成功しました！"
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @sauna_post = Post.find_by(sauna_id: params[:sauna_id], id: params[:id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
