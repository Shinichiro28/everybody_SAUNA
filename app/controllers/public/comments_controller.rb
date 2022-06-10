class Public::CommentsController < ApplicationController

  def create
    @sauna_post_comment = Comment.new(user_id: current_user.id, sauna_id: params[:sauna_id], post_id: params[:post_id])
    if @sauna_post_comment.save
      flash[:notice] = "コメント投稿に成功しました！"
      redirect_to request.referer
    else
      flash[:notice] = "コメント投稿に失敗しました。"
      redirect_to request.referer
    end
  end

  def destroy
    @sauna_post_comment = Comment.find_by(comment_id: params[:id], user_id: current_user.id, sauna_id: params[sauna_id], post_id: params[:post_id])
    @sauna_post_comment.destroy
    redirect_to request.referer
  end

end
