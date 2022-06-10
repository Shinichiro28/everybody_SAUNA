class Favorite < ApplicationRecord

    #アソシエーション
  belongs_to :saunner
  belongs_to :post
  belongs_to :sauna, through: :post

   #メソッドに引数指定
  def favorited?
     #引数のidと等しいuser_idを持つレコードは、favoritesテーブル内に存在するか
    favorites.where(user_id: user.id).exists?
  end

end
