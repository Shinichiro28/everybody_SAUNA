class Product < ApplicationRecord

  belongs_to :genre
  has_many :cart_products, dependent: :destroy
  has_many :order_products, dependent: :destroy

  has_one_attached :product_image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :product_image, presence: true

  def with_tax_price
    (price * 1.1).floor
  end

end
