class Comment < ApplicationRecord

    #アソシエーション
  belongs_to :saunner
  belongs_to :post

    #バリデーション
  validates :comment, presence: true

end
