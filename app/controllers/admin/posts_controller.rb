class Admin::PostsController < ApplicationController

  def show
    @saunner = Saunner.find_by(params[:saunner_id])
    @sauna = Sauna.find_by(params[:sauna_id])
    @post = Post.find(params[:id])
    @post_tags = @post.tags
    @comments = @post.comments
  end

  def index
    @saunner = Saunner.find_by(params[:saunner_id])
    @sauna = Sauna.find_by(params[:sauna_id])
    @posts = @sauna.posts.page(params[:page]).per(5)
    @post = Post.find_by(params[:id])
    @tag_list = @post.tags
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "サ活投稿を削除しました。"
      redirect_to admin_sauna_posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:saunner_id, :sauna_id, :visit_date, :sauna_minutes, :mizu_minutes, :totonoi_minutes, :sauna_times, :sauna_temperature, :mizu_temperature, :sauna_post, :food_name, :food_post, :is_active)
  end

end
