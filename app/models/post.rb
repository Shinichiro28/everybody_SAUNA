class Post < ApplicationRecord

    #アソシエーション
  has_many :comments, dependent: :destroy
  belongs_to :favorite
  belongs_to :sauna
  belongs_to :saunner

end
