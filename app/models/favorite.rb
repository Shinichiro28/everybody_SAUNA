class Favorite < ApplicationRecord
  # アソシエーション
  belongs_to :saunner
  belongs_to :post
  belongs_to :sauna

  # 一つの投稿に対して、一人につき一つしかいいねをつけられない。
  validates_uniqueness_of :post_id, scope: :saunner_id

  # メソッドに引数指定
  def favorited?
    # 引数のidと等しいuser_idを持つレコードは、favoritesテーブル内に存在するか
    favorites.where(saunner_id: current_saunner.id).exists?
  end
end
