class Admin::ChatGroupsController < ApplicationController

  def index
    @chat_groups = ChatGroup.all
  end

  def show
    @chat_group = ChatGroup.find(params[:id])
  end

  def edit
    @chat_group = ChatGroup.find(params[:id])
  end

  def destroy
  end

  def all_destroy
  end

end
