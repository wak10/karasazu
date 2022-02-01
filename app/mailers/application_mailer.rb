class ApplicationMailer < ActionMailer::Base
  default from: 'pf.test939@gmail.com',
  bcc: "pf.test939@gmail.com"
  layout 'mailer'
end
