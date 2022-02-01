  require File.expand_path(File.dirname(__FILE__) + "/environment")

  set :environment, :production
  set :output, 'log/cron.log'


  every :day, at: "21:55 pm" do
    runner "GrowPlant.send_mail"
  end