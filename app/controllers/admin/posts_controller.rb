class Admin::PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @post_tags = @post.tags
    @comments = @post.comments
  end

  def index
    @posts = Post.page(params[:page]).per(5).order(created_at: :desc)
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "サ活投稿を削除しました。"
      redirect_to admin_posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:saunner_id, :sauna_id, :visit_date, :sauna_minutes, :mizu_minutes, :totonoi_minutes, :sauna_times, :sauna_temperature, :mizu_temperature, :sauna_post, :food_name, :food_post, :is_active)
  end

end
