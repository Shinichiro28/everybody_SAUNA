class Public::ChatsController < ApplicationController

  def show
    @saunner = Saunner.find(params[:id])
    chat_groups = current_saunner.chat_group_user.pluck(:chat_group_id)

  end
end
