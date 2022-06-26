class Admin::ContactsController < ApplicationController

  def show
    @contact = Contact.find(params[:id])
  end

  def index
    #１ページに１０投稿、新規順
    @contacts = Contact.page(params[:page]).per(10).order(created_at: :desc)
  end

end
