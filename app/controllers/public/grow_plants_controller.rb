class Public::GrowPlantsController < ApplicationController

  def index
    @plants = Plant.all
  end

  def pick
    @plant = Plant.find(params[:id])
    @grow_plant = GrowPlant.new
  end

  def show
  end

  def complete
  end

  def create
    @grow_plant = current_user.grow_plants.new(grow_plant_params)
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

  def grow_plant_params
    params.require(:grow_plant).permit( :plant_id, :user_id, :nick_name)
  end

end