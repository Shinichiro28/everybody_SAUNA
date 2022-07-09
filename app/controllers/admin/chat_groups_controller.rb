class Admin::ChatGroupsController < ApplicationController
  def index
    @chat_groups = ChatGroup.page(params[:page]).per(5).order(created_at: :desc)
  end

  def show
    @chat_group = ChatGroup.find(params[:id])
  end

  def all_destroy
    @chat_group = ChatGroup.find(params[:chat_group_id])
    if @chat_group.destroy
      redirect_to admin_chat_groups_path
    end
  end
end
