class Public::PostsController < ApplicationController


  def new
    @post = Post.new
    @sauna = Sauna.find(params[:sauna_id])
  end

  def show
    @sauna = Sauna.find_by(params[sauna_id])
    @post = Post.find(params[:id])
    @sauna_post_comment = Comment.new
    @sauna_post_comments = @post.Comment.all
  end

  def index
    @posts = Post.all

    @sauna = Sauna.find(params[:sauna_id])
  end

  def edit
    @post = Post.find(params[:id])
    @sauna = Sauna.find(params[:sauna_id])
  end

  def create
    @sauna = Sauna.find(params[:sauna_id])
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "サ活投稿に成功しました！"
      redirect_to sauna_path(@post.id)
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿内容更新に成功しました！"
      redirect_to sauna_posts
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "サ活投稿を削除しました。"
      redirect_to request.referer
    end
  end


  private

  def post_params
    params.require(:post).permit(:saunner_id, :sauna_id, :visit_date, :sauna_minutes, :mizu_minutes, :totonoi_minutes, :sauna_times, :sauna_temperature, :mizu_temperature, :sauna_post, :food_name, :food_post, :is_active)
  end

end
