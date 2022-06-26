class Notification < ApplicationRecord

  #アソシエーション
    #並び順を作成日時の新しい順
  default_scope -> { order(created_at: :desc) }
    #nilを許可
    
  belongs_to :post, optional: true
  belongs_to :comment, optional: true
    #通知を送ったユーザー
  belongs_to :visitor, class_name: 'Saunner', foreign_key: 'visitor_id', optional: true
    #通知を受け取ったユーザー
  belongs_to :visited, class_name: 'Saunner', foreign_key: 'visited_id', optional: true
end
