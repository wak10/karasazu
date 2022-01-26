class CustomPlant < ApplicationRecord

  has_many :grow_plants, dependent: :destroy
  belongs_to :user

  attachment :image

  enum recommend_place:{ 日向:0, 半日陰:1 }

end
