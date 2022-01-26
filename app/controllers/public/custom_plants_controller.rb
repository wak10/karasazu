class Public::CostomPlantsController < ApplicationController

  def new
    @costom_plant = CostomPlant.new

  end

  def add
    @costom_plant = CostomPlant.new(costom_plant_params)
    if @costom_plant.save
      redirect_to grow_plants_path
    else
      render :new
    end
  end

  def pick
    @grow_plant_new = GrowPlant.new
    @costom_plant = CostomPlant.find(params[:id])
  end

  def create
    @grow_plant_new = current_user.grow_plants.new(grow_plant_params)
    @costom_plant = CostomPlant.find(params[:id])

    byebug
    if @grow_plant.save
      redirect_to  top_path
    else
      render :pick
    end
  end


  private

  def costom_plant_params
    params.require(:costom_plant).permit( :user_id, :plant_name, :image, :frequency, :amount)
  end

  def grow_plant_params
    params.require(:grow_plant).permit( :plant_id, :costom_plant_id, :user_id, :nick_name, :place, :image)
  end
end
