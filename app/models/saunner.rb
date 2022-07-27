class Saunner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション

  has_many :favorites, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :chat_group_users, dependent: :destroy
  # 中間テーブル
  has_many :chat_groups, through: :chat_group_users, dependent: :destroy
  # グループオーナー表示
  has_many :owned_chat_groups, class_name: "ChatGroup"
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :saunas
  # お問合せ
  has_many :contacts, dependent: :destroy
  # 自分からの通知
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  # 相手からの通知
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products
  has_many :orders, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy

  # バリデーション
  validates :last_name, presence: true
  validates :first_name, presence: true

  has_one_attached :profile_image

  def get_profile_image
    profile_image.attached ? profile_image : 'no_saunner.jpg'
  end

  def self.guest
    find_or_create_by!(first_name: 'guest', last_name: 'saunner', nickname: 'guestsaunner', email: 'guest@example.com') do |saunner|
      saunner.password = SecureRandom.urlsafe_base64
      saunner.first_name = "guest"
      saunner.last_name = "saunner"
      saunner.nickname = "guestsaunner"
    end
  end
end
