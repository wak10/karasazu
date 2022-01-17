class Plant < ApplicationRecord
  has_many :grow_plants
  attachment :image

  enum recommend_place:{ 日向:0, 半日陰:1 }

  validates :plant_name, presence: true
  validates :amount, presence: true
  validates :frequency, presence: true
end
