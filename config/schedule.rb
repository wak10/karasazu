  require File.expand_path(File.dirname(__FILE__) + "/environment")

  set :environment, :production
  set :output, 'log/cron.log'


  every :day, at: "0:00 am" do
    runner "GrowPlant.send_mail"
  end