class ChatGroup < ApplicationRecord

    #アソシエーション
  has_many :chats, dependent: :destroy
  has_many :chat_group_users

end
