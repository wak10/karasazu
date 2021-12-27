class Public::HomesController < ApplicationController

  def top
    @plants = Plant.all
    @grow_plants = GrowPlant.all
  end

  def about
  end

end
