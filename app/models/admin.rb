class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #saunaモデルの投稿写真
  def get_store_image
      (store_image.attached?) ? store_image : 'no_store.jpeg'
  end


end
