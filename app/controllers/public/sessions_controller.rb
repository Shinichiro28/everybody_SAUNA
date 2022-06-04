# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :saunner_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

   protected

   def saunner_state
  ## 入力されたemailからアカウントを1件取得
      @saunner = Saunner.find_by(email: params[:saunner][:email])
      ## アカウントを取得できなかった場合、このメソッドを終了する
      return if !@saunner
      ## 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
      if @saunner.valid_password?(params[:saunner][:password]) && @saunner.is_deleted
        redirect_to new_saunner_registration_path
      end
   end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
