class Comment < ApplicationRecord

  #アソシエーション
  belongs_to :saunner
  belongs_to :post
  belongs_to :sauna
   #通知モデル
  has_many :notifications, dependent: :destroy


    #バリデーション
  validates :comment, presence: true

end
