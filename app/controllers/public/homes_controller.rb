class Public::HomesController < ApplicationController

  def top
    @plants = Plant.all
  end

  def about
  end

end
