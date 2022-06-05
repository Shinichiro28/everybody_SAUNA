class Chat < ApplicationRecord

    #アソシエーション
  belongs_to :saunner
  belongs_to :chat_group

    #バリデーション
  validates :message, presence: true

end
