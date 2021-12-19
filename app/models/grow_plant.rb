class GrowPlant < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  has_many :logs, dependent: :destroy
end
