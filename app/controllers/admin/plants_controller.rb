class Admin::PlantsController < ApplicationController

  def index
    @plants = Plant.all
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.save
    redirect_to admin_plants_path
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.update(plant_params)
    redirect_to admin_plants_path
  end

  private

  def plant_params
    params.require(:plant).permit(:plant_name, :image, :frequency, :amount, :advice)
  end

end
