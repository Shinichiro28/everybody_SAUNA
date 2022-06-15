class Public::CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.saunner = current_saunner
    if @comment.save
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
    params.require(:comment).permit(:comment, :sauna_id, :saunner_id, :post_id)
  end
end
