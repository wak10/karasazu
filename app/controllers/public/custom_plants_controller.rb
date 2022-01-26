class Public::CustomPlantsController < ApplicationController

  def new
    @custom_plant = CustomPlant.new

  end

  def create
    @custom_plant = CustomPlant.new(custom_plant_params)
    if @custom_plant.save
      redirect_to grow_plants_path
    else
      render :new
    end
  end

  # def pick
  #   @grow_plant_new = GrowPlant.new
  #   @custom_plant = CustomPlant.find(params[:id])
  # end

  # def create
  #   @grow_plant_new = current_user.grow_plants.new(grow_plant_params)
  #   @custom_plant = CustomPlant.find(params[:id])

  #   byebug
  #   if @grow_plant.save
  #     redirect_to  top_path
  #   else
  #     render :pick
  #   end
  # end


  private

  def custom_plant_params
    params.require(:custom_plant).permit( :user_id, :plant_name, :image, :frequency, :amount, :advice, :recommend_place )
  end

  def grow_plant_params
    params.require(:grow_plant).permit( :plant_id, :custom_plant_id, :user_id, :nick_name, :place, :image)
  end
end
