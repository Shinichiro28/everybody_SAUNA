class Sauna < ApplicationRecord

  enum is_active: { release: 0, close: 1 }

    #アソシエーション
  has_many :posts, dependent: :destroy
  belongs_to :saunner, optional: true
  has_many :favorites, through: :posts

    #バリデーション
  validates :name, presence: true
  validates :prefecture, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :tel, presence: true

  has_one_attached :store_image

  def self.looks(search, word)
    if search == "partial_match"
      @sauna = Sauna.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end

end
