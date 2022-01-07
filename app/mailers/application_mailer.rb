class ApplicationMailer < ActionMailer::Base
  default from: 'カラサズ通知',
    bcc: "pf.test939@gmail.com"
  layout 'mailer'
end
