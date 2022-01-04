class GrowPlant < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  has_many :logs, dependent: :destroy

  enum place:{ 日向:0, 半日陰:1 }
end














