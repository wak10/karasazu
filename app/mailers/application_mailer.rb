class ApplicationMailer < ActionMailer::Base
  default from: '水やり通知<pf.test939@gmail.com>',
  bcc: "pf.test939@gmail.com"
  layout 'mailer'
end
