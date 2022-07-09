class ChatGroupUser < ApplicationRecord
  # アソシエーション
  belongs_to :saunner
  belongs_to :chat_group
end
