class Favorite < ApplicationRecord

    #アソシエーション
  belongs_to :saunner
  belongs_to :post

end
