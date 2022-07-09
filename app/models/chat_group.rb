class ChatGroup < ApplicationRecord
  # アソシエーション
  has_many :chats, dependent: :destroy
  has_many :chat_group_users
  has_many :saunners, through: :chat_group_users, dependent: :destroy
  # グループオーナー表示
  belongs_to :saunner

  # バリデーション
  validates :name, presence: true
end
