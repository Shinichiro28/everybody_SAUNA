class Sauna < ApplicationRecord



  enum target: { exist: 0, not_exist: 1 }
  enum swap: { exist: 0, not_exist: 1 }
  enum tv: { exist: 0, not_exist: 1 }
  enum vibra: { exist: 0, not_exist: 1 }
  enum break_space: { exist: 0, not_exist: 1 }
  enum air_bath: { exist: 0, not_exist: 1 }
  enum aufguss: { exist: 0, not_exist: 1 }
  enum auto_loyly: { exist: 0, not_exist: 1 }
  enum self_loyly: { exist: 0, not_exist: 1 }
  enum inside_break_space: { exist: 0, not_exist: 1 }
  enum wi_fi: { exist: 0, not_exist: 1 }
  enum supply: { exist: 0, not_exist: 1 }
  enum work_space: { exist: 0, not_exist: 1 }
  enum restaurant: { exist: 0, not_exist: 1 }
  enum parking: { exist: 0, not_exist: 1 }
  enum dispenser: { exist: 0, not_exist: 1 }
  enum oropo: { exist: 0, not_exist: 1 }
  enum tattoo: { exist: 0, not_exist: 1 }
  enum shampoo: { exist: 0, not_exist: 1 }
  enum conditioner: { exist: 0, not_exist: 1 }
  enum bodysoap: { exist: 0, not_exist: 1 }
  enum facesoap: { exist: 0, not_exist: 1 }
  enum razor: { exist: 0, not_exist: 1 }
  enum toothbrush: { exist: 0, not_exist: 1 }
  enum nylon_towel: { exist: 0, not_exist: 1 }
  enum hairdryer: { exist: 0, not_exist: 1 }
  enum facetowel: { exist: 0, not_exist: 1 }
  enum bathtowell: { exist: 0, not_exist: 1 }
  enum pants: { exist: 0, not_exist: 1 }
  enum saunamat: { exist: 0, not_exist: 1 }
  enum saunaboard: { exist: 0, not_exist: 1 }
  enum is_active: { release: 0, close: 1 }

    #アソシエーション
  has_many :posts, dependent: :destroy
  belongs_to :saunner

    #バリデーション
  validates :name, presence: true
  validates :prefecture, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :tel, presence: true



end
