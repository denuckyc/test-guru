class ApplicationMailer < ActionMailer::Base
  default from: %{"Тест-Гуру" <mail@testguru.com>}
  layout 'mailer'
end
