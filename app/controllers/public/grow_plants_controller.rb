class Public::GrowPlantsController < ApplicationController

  def index
    # @plants = Plant.all

    @grow_plants = GrowPlant.all
    @grow_plants.find_each do |grow_plant|
      @frequency = grow_plant.plant.frequency
      grow_plant.logs.last(1).each do |last_log|
        @next_log = last_log.created_at.to_date + @frequency.days
        @today = Date.today
        if @next_log <= @today

          # logに紐付いているgrow_plantを取得し、water.mailer.rbへ送る
          @grow_plant = grow_plant
          WaterMailer.send_mail(grow_plant).deliver_now
          p "send_mail"
        elsif
          p "false"
        end

        # redirect_to top_path and return

      end
    end

  end

  def pick
    @plant = Plant.find(params[:id])
    @grow_plant = GrowPlant.new
  end

  def create
    @grow_plant = current_user.grow_plants.new(grow_plant_params)
    @grow_plant.save
    redirect_to  top_path
  end

  def show
    @grow_plant = GrowPlant.find(params[:id])
    @log = Log.new
    @frequency = @grow_plant.plant.frequency
  end

  def complete
    @log = Log.new(log_params)
    @log.save
    redirect_to action: :show
  end

  def updete
  end

  def destroy
    @grow_plant = GrowPlant.find(params[:id])
    @grow_plant.destroy
    redirect_to top_path
  end

  private

  def plant_paramas
    params.require(:plant).permit( :plant_name, :image, :frequency, :amount, :advice)
  end

  def grow_plant_params
    params.require(:grow_plant).permit( :plant_id, :user_id, :nick_name, :place)
  end

  def log_params
    params.require(:log).permit( :grow_plant_id, :user_id, :created_at)
  end

end