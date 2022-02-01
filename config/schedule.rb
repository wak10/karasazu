  require File.expand_path(File.dirname(__FILE__) + "/environment")

  set :environment, :production
  set :output, 'log/cron.log'


  every 2.minutes do
    runner "GrowPlant.send_mail"
  end