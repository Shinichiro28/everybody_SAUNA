class Public::ChatGroupsController < ApplicationController

  def new
    @chat_group = ChatGroup.new
  end

  def show
    @chat_group = ChatGroup.find(params[:id])
  end

  def index
    @chat_groups = ChatGroup.all
    @chat_group_join = ChatGroupUser.where(user_id: current_user.id)
  end

  def create
    @chat_group = ChatGroup.new(chat_group_params)
    if @chat_group.save
      flash[:notice] = "チャットグループを作成しました"
      redirect_to chat_groups_path
    else
      flash[:notice] = "チャットグループ作成に失敗しました"
      render :new
    end

  end

  def destroy
  end


  private

  def chat_group_params
    params.require(:chat_group).permit(:name,:introduction,:owner_id)
  end

end
