class CostomPlant < ApplicationRecord
  belongs_to :user
  has_many :grow_plants

  attachment :image
end
