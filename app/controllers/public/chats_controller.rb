class Public::ChatsController < ApplicationController

  def show
     #どのグループなのかを指定
    @chat_group = ChatGroup.find_by(params[:chat_group_id])
     #指定したグループのチャットたち
    @chats = @chat_group.chats
    @saunner = Saunner.find_by(params[:saunner_id])
  end

  def create
    @chat_group = ChatGroup.find(params[:chat_group_id])
    @chat = @chat_group.chats.new(chat_params)
    @chat.saunner_id = current_saunner.id
    @chat.save
    redirect_to chat_group_path(@chat_group.id)
  end

  def destroy
    @chat = current_saunner.chats.find(params[:id])
    @chat.destroy
    redirect_to chat_group_chat_room_path
  end

  private

  def chat_params
    params.require(:chat).permit(:saunner_id, :chat_group_id, :message)
  end

end
