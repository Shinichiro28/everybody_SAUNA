class Public::PostsController < ApplicationController

  before_action :ensure_current_saunner, only: [:edit, :destroy]


  def new
    @post = Post.new(saunner_id: current_saunner.id, sauna_id: params[:sauna_id])
    @sauna = Sauna.find(params[:sauna_id])
  end

  def show
    @saunner = Saunner.find_by(params[:saunner_id])
    @sauna = Sauna.find(params[:sauna_id])
    @post = Post.find(params[:id])
    @post_tags = @post.tags
    @comment = Comment.new
    @comments = Comment.page(params[:page]).per(5)
  end

  def index
    @sauna = Sauna.find(params[:sauna_id])
    @saunner = Saunner.find_by(params[:saunner_id])
    @posts = @sauna.posts.page(params[:page]).per(5)
    @post = Post.find_by(params[:id])
    @tag_list = @post.tags
  end

  def edit
    @sauna = Sauna.find(params[:sauna_id])
    @post = Post.find(params[:id])
    @tag_list=@post.tags.pluck(:name).join(',')
  end

  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list = Tag.all
　　#検索されたタグを受け取る
    @tag = Tag.find(params[:tag_id])
　　#検索されたタグに紐づく投稿を表示
    @posts = @tag.posts.page(params[:page]).per(10)
    @post = Post.find(params[:id])
  end

  def create
    @sauna = Sauna.find_by(id: params[:sauna_id])
    @post = @sauna.posts.new(post_params)
    @post.saunner = current_saunner
    #tag_list = params[:post][:name].split(',')
    if @post.save
     # @post.save_tag(tag_list)
      flash[:notice] = "サ活投稿に成功しました！"
      redirect_to sauna_posts_path
    else
      render 'new'
    end
  end

  def update
    @sauna = Sauna.find(params[:sauna_id])
    @post = Post.find(params[:id])
     #入力されたタグを受け取る
    tag_list=params[:post][:name].split(',')
     #情報の更新
    if @post.update(post_params)
      if params[:post][:status] == "公開"
         #post_idに紐づいていたタグ
        @old_relations = PostTag.where(post_id: @post.id)
         #それらを取り出し、消す。
        @old_relations.each do |relation|
          relation.delete
        end
        @post.save_tag(tag_list)
        flash[:notice] = "投稿内容更新に成功しました！"
        redirect_to sauna_posts_path(sauna_id: @sauna.id)
      else
        flash[:notice] = "下書きに登録しました。"
        redirect_to sauna_posts_path(sauna_id: @sauna.id)
      end
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "サ活投稿を削除しました。"
      redirect_to sauna_posts_path
    end
  end


  private

  def post_params
    params.require(:post).permit(:saunner_id, :sauna_id, :visit_date, :sauna_minutes, :mizu_minutes, :totonoi_minutes, :sauna_times, :sauna_temperature, :mizu_temperature, :sauna_post, :food_name, :food_post, :is_active)
  end

  def ensure_current_saunner
    @post = Post.find_by(params[:post_id])
    if @post.saunner == current_saunner
      redirect_to request.referer
    end
  end

end
