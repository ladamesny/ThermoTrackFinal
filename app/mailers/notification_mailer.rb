class NotificationMailer < ActionMailer::Base
  default from: "adames.larry@gmail.com"
  def notification_mail(user, thermometer)
    @user = user
    @thermometer = thermometer
    mail(to: @user.email, subject: "#{@user.name}! Thermometer #{@thermometer.name} is out of bounds!")
  end
end
