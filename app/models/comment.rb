class Comment < ApplicationRecord

    #アソシエーション
  belongs_to :saunner
  belongs_to :post
  belongs_to :sauna

    #バリデーション
  validates :comment, presence: true

end
