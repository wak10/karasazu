class Plant < ApplicationRecord
  has_many :grow_plants
  attachment :image
end
