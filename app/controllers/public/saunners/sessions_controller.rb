class Public::Saunners::SessionsController < Devise::SessionsController

  def guest_sign_in
    saunner = Saunner.guest
    sign_in saunner
    redirect_to saunner_path(saunner), notice: 'guestsaunnerでログインしました。'
  end
end
