class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
         #ステータス有効のみ表示/新規投稿順3つのみ表示
    @new_posts = Post.limit(3).order(created_at: :desc)
    @new_saunas = Sauna.where(is_active: false).limit(3).order(created_at: :desc)
    @new_contacts = Contact.limit(3).order(created_at: :desc)
    @saunners = Saunner.all
    @saunas = Sauna.all
  end


end
