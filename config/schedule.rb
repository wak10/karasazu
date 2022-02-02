  require File.expand_path(File.dirname(__FILE__) + "/environment")

  set :environment, :production
  set :output, 'log/cron.log'

  def jst(time)
    Time.zone = 'Asia/Tokyo'
    Time.zone.parse(time).localtime($system_utc_offset)
  end

  every :day, at: "9:30 pm" do
    runner "GrowPlant.send_mail"
  end