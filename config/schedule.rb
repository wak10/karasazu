  require File.expand_path(File.dirname(__FILE__) + "/environment")
  rails_env = Rails.env.to_sym
  set :environment, rails_env
  set :output, 'log/cron.log'

  every 2.minute do
    runner "GrowPlant.send_mail"
  end