class Public::ContactsController < ApplicationController
  before_action :authenticate_saunner!

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.saunner_id = current_saunner.id
    if @contact.save
      flash[:notice] = "送信に成功しました。"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :title, :content)
  end
end
