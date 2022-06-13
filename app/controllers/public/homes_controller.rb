class Public::HomesController < ApplicationController
  def top
     #ステータス有効のみ表示/新規投稿順に5つのみ表示
    @new_posts = Post.where(is_active: true).limit(3).order(created_at: :desc)
     #admin作成後に有効のみ表示にする
    @new_saunas = Sauna.limit(2).order(created_at: :desc)
    @saunners = Saunner.all
    @saunas = Sauna.all
  end

  def about
  end

end
