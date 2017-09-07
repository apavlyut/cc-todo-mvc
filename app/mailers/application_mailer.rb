class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com', host: ENV['APP_HOST']
  layout 'mailer'
end
