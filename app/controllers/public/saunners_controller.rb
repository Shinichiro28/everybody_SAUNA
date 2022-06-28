class Public::SaunnersController < ApplicationController
  before_action :authenticate_saunner!
   #ゲストユーザーユーザー編集画面遷移不可(URL直接入力された場合)
  before_action :ensure_guest_saunner, only: [:edit]

  def show
    @saunner = current_saunner
  end

  def edit
    @saunner = current_saunner
  end

  def update
    @saunner = current_saunner
    if @saunner.update(saunner_params)
      flash[:notice] = "会員情報の更新に成功しました"
      redirect_to my_page_path
    else
      render :edit
    end
  end

  def favorites
    favorites = Favorite.where(saunner_id: current_saunner.id).pluck(:post_id)
    @favorite_posts = Post.order(created_at: :desc).find(favorites)
  end

  def unsubscribe
    @saunner = current_saunner
  end

  def withdrawal
    @saunner = current_saunner
    @saunner.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理が完了しました。またのご利用をお待ちしております！"
    redirect_to root_path
  end

  private

  def saunner_params
    params.require(:saunner).permit(:sauna_id, :post_id, :last_name,:first_name,:nickname, :email, :sauna_image)
  end

    #マイページにリダイレクト
  def ensure_guest_saunner
    if current_saunner.nickname == "guestsaunner"
      redirect_to my_page_path(current_saunner) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
