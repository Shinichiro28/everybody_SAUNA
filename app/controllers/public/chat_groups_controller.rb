class Public::ChatGroupsController < ApplicationController
  before_action :authenticate_saunner!
   #オーナー以外のユーザーが直接URLで編集画面に入った時の対処
  before_action :ensure_correct_saunner, only: [:edit, :update]

  def new
    @chat_group = ChatGroup.new
  end

  def show
    @chat_group = ChatGroup.find(params[:id])
  end

  def join
    @chat_group = ChatGroup.find(params[:chat_group_id])
    @chat_group.saunners << current_saunner
    redirect_to chat_groups_path
  end

  def index
    @chat_groups = ChatGroup.all
  end

  def create
    @saunner = Saunner.find(params[:saunner_id])
    @chat_group_user = @saunner.chat_group_users.find_by(params[:chat_group_user])
    @chat_group = @chat_group_user.owned_chat_groups.new(chat_group_params)
    @chat_group.owner_id = current_saunner.id
     #作成と同時にそのグループのメンバー
    @chat_group.saunners << current_saunner
    if @chat_group.save
      flash[:notice] = "チャットグループを作成しました"
      redirect_to chat_group_path(@chat_group)
    else
      flash[:notice] = "チャットグループ作成に失敗しました"
      render :new
    end
  end

  def edit
    @chat_group = ChatGroup.find(params[:id])
  end

  def destroy
    @chat_group = ChatGroup.find(params[:id])
     #ログインユーザーが@chat_group.saunnersから消去
    @chat_group.saunners.delete(current_saunner)
    redirect_to chat_groups_path
  end

   #グループ削除
  def all_destroy
    @chat_group = ChatGroup.find(params[:chat_group_id])
    if @chat_group.destroy
    redirect_to chat_groups_path
    end
  end

  def update
    @chat_group = ChatGroup.find(params[:id])
    if @chat_group.update(chat_group_params)
      flash[:notice] = "チャットグループを更新しました。"
      redirect_to chat_groups_path
    else
      render "edit"
    end
  end


  private

  def chat_group_params
    params.require(:chat_group).permit(:name,:introduction)
  end

  def ensure_correct_saunner
    @chat_group = ChatGroup.find(params[:id])
    unless @group.owner_id == current_saunner.id
      redirect_to chat_groups_path
    end
  end

end
