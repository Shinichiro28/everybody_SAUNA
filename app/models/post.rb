class Post < ApplicationRecord

    #アソシエーション
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :sauna, optional: true
  belongs_to :saunner, optional: true

    #バリデーション
  validates :sauna_minutes, presence: true
  validates :mizu_minutes, presence: true
  validates :totonoi_minutes, presence: true
  validates :sauna_times, presence: true
  validates :sauna_post, presence: true

  has_one_attached :sauna_image
  has_one_attached :food_image

  def get_sauna_image
      (sauna_image.attached?) ? sauna_image : 'no_sauna.jpeg'
  end

  def favorited?(saunner)
    favorites.where(saunner_id: saunner.id).exists?
  end

end
