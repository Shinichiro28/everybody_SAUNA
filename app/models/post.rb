class Post < ApplicationRecord

    #アソシエーション
  has_many :comments, dependent: :destroy
  belongs_to :favorite
  belongs_to :sauna
  belongs_to :saunner

    #バリデーション
  validates :sauna_minutes, presence: true
  validates :mizu_minutes, presence: true
  validates :totonoi_minutes, presence: true
  validates :sauna_times, presence: true
  validates :sauna_post, presence: true

  has_one_attached :sauna_image
  has_one_attached :food_image

end
