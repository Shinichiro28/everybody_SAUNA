class Post < ApplicationRecord

    #アソシエーション
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :sauna, foreign_key: 'sauna_id'
  belongs_to :saunner, foreign_key: 'saunner_id'

  has_many :post_tags,dependent: :destroy
  has_many :tags,through: :post_tags

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

  def save_tag(sent_tags)
    # タグが存在 => タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete　Tag.find_by(name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
    end
  end

end
