class Public::NotificationsController < ApplicationController
  def index
    @notifications = current_saunner.passive_notifications.page(params[:page]).per(10)
    # 未確認の通知のみ取り出し、確認後の更新する
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end
