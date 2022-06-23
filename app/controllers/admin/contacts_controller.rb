class Admin::ContactsController < ApplicationController

  def show
    @contact = Contact.find(params[:id])
    @saunner = Saunner.find_by(params[:saunner_id])
  end

  def index
    @contacts = Contact.page(params[:page]).per(10)
    @saunner = Saunner.find_by(params[:saunner_id])
  end

end
