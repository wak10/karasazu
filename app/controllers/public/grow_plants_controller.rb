class Public::GrowPlantsController < ApplicationController

  def index
    @plants = Plant.all
  end

  def pick
    @plant = Plant.find(params[:id])
  end

  def show
  end

  def complete
  end

  def create
    @grow_plant = current_user.grow_plant.new(grow_plant_params)
    @grow_plant.save
    redirect_to  top_path
  end

  def updete
  end

  def destroy
  end

  private

  def plant_paramas
    params.require(:plant).permit( :plant_name, :image, :frequency, :amount, :advice)
  end

end
