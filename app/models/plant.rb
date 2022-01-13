class Plant < ApplicationRecord
  has_many :grow_plants
  attachment :image

  validates :plant_name, presence: true
  validates :amount, presence: true
  validates :frequency, presence: true
end
