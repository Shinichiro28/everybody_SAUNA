class Order < ApplicationRecord

  belongs_to :saunner
  has_many :order_products, dependent: :destroy

end
