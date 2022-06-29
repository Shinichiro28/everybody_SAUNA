class Post < ApplicationRecord

  #アソシエーション

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :sauna, foreign_key: 'sauna_id'
  belongs_to :saunner, foreign_key: 'saunner_id'

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
   #通知モデルとの紐付け
  has_many :notifications, dependent: :destroy


    #バリデーション
  validates :visit_date, presence: true
  validates :sauna_minutes, presence: true
  validates :mizu_minutes, presence: true
  validates :totonoi_minutes, presence: true
  validates :sauna_times, presence: true
  validates :sauna_post, presence: true

  has_one_attached :sauna_image
  has_one_attached :food_image

  def get_sauna_image
      (sauna_image.attached?) ? sauna_image : 'no_sauna.jpg'
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

  def create_notification_favorite!(current_saunner)
     #既に「いいね」されているか検索 いいね連打対策
    temp = Notification.where(["visitor_id = ? and visited_id = ? and sauna_id = ? and post_id = ? and action = ? ", current_saunner.id, saunner_id, sauna_id, id, 'favorite'])
     #いいねされていない場合のみ通知レコードを作成
    if temp.blank?
      notification = current_saunner.active_notifications.new(
        sauna_id: sauna_id,
        post_id: id,
        visited_id: saunner_id,
        action: 'favorite'
      )
        #自分の投稿にいいねする際は、通知済みにする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_comment!(current_saunner, comment_id)
      #自分以外にコメントしている人を全て取得し、全員に通知を送る
    temp_ids = Comment.select(:saunner_id).where(sauna_id: sauna_id, post_id: self.id).where.not(saunner_id: current_saunner.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_saunner, comment_id)
    end
      #誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_saunner, comment_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_saunner, comment_id)
      #コメントのたびに通知
    notification = current_saunner.active_notifications.new(
      sauna_id: sauna_id,
      post_id: id,
      comment_id: comment_id,
      visited_id: saunner_id,
      action: 'comment'
    )
      #自分の投稿に対するコメントは、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
