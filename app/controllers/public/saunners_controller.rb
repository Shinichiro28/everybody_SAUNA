class Public::SaunnersController < ApplicationController
  before_action :authenticate_saunner!

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

  def unsubscribe
    @saunner = current_saunner
  end

  def withdrawal
    @saunner = current_saunner
    @saunner.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理が完了しました。またのご利用をお待ちしております！"
    redirect_to :root_path
  end

  private

  def saunner_params
    params.require(:saunner).permit(:last_name,:first_name,:nickname, :email)
  end

end
