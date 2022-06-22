module Public::NotificationsHelper
  def unchecked_notifications
    @notifications = current_saunner.passive_notifications.where(checked: false)
  end
end
