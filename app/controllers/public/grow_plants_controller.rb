class Public::GrowPlantsController < ApplicationController
  before_action :authenticate_user!

  def top
    @grow_plants = current_user.grow_plants
    @sunny_place = @grow_plants.where(place: 0)
    @half_sunny_place = @grow_plants.where(place: 1)
  end

  def index
    @plants = Plant.all
  end

  def pick
    @plant = Plant.find(params[:id])
    @grow_plant = GrowPlant.new
  end

  def create
    @grow_plant = current_user.grow_plants.new(grow_plant_params)
    @grow_plant.image ||= @grow_plant.plant.image

    if @grow_plant.save
      redirect_to  top_path
    else
      render :pick
    end
  end

  def show
    @grow_plant = GrowPlant.find(params[:id])
    @frequency = @grow_plant.plant.frequency
    @log = Log.new
    @logs = @grow_plant.logs.includes(:grow_plant)
  end

  def complete
    @log = Log.new(log_params)
    @log.save
    redirect_to action: :show
  end

  def edit
    @grow_plant = GrowPlant.find(params[:id])
  end

  def update
    @grow_plant = GrowPlant.find(params[:id])
    if @grow_plant.update(grow_plant_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @grow_plant = GrowPlant.find(params[:id])
    @grow_plant.destroy
    redirect_to top_path
  end

  private

  def plant_paramas
    params.require(:plant).permit( :plant_name, :image, :frequency, :amount, :advice, :recommend_place)
  end

  def grow_plant_params
    params.require(:grow_plant).permit( :plant_id, :user_id, :nick_name, :place, :image)
  end

  def log_params
    params.require(:log).permit( :grow_plant_id, :user_id, :created_at)
  end


end