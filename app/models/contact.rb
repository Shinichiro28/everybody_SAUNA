class Contact < ApplicationRecord
  # アソシエーション
  belongs_to :saunner

  # バリデーション
  validates :name, presence: true
  validates :content, presence: true
end
