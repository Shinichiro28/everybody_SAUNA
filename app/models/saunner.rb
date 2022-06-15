class Saunner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    #アソシエーション
  has_many :favorites, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :chat_group_users, dependent: :destroy
   #中間テーブル
  has_many :chat_groups, through: :chat_group_users, dependent: :destroy
   #グループオーナー表示
  has_many :owned_chat_groups, class_name: "ChatGroup"
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :saunas

    #バリデーション
  validates :last_name, presence: true
  validates :first_name, presence: true

  has_one_attached :profile_image

  def self.guest
    find_or_create_by!(name: 'guestsaunner' ,email: 'guest@example.com') do |saunner|
      saunner.password = SecureRandom.urlsafe_base64
      saunner.name = "guestsaunner"
    end
  end

end
