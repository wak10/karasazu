class Public::HomesController < ApplicationController

  def top
    @grow_plants = current_user.grow_plants
  end

  def about
  end

end
