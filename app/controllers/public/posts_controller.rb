class Public::PostsController < ApplicationController


  def new
    @post = Post.new
    @sauna = Sauna.find(params[:sauna_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @post = Post.all
    if get sauna_posts_path(sauna_id)
      @sauna = Sauna.find(params[:sauna_id])
    else
    end
    @saunner = Saunner.find(params[:saunner_id])
  end

  def edit
    @post = Post.find(params[:id])
    @sauna = Sauna.find(params[:sauna_id])
  end

  def create
    @post = Post.new(sauna_params)
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
