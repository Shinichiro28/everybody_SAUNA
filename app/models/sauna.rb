class Sauna < ApplicationRecord


  #アソシエーション
  has_many :posts, dependent: :destroy
  belongs_to :saunner, optional: true
  has_many :favorites, through: :posts
  has_many :comments, dependent: :destroy


    #バリデーション
  validates :name, presence: true
  validates :prefecture, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :tel, presence: true

  has_one_attached :store_image

  def get_store_image
      (store_image.attached?) ? store_image : 'no_store.jpeg'
  end

  #検索機能
  def self.looks(search, word)
    if search == "partial_match"
      @sauna = Sauna.where("name LIKE?","%#{word}%").where(is_active: true)
    else
      @sauna = Sauna.where(is_active: true)
    end
  end

end
