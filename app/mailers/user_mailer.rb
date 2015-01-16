class UserMailer < ActionMailer::Base
  default from: "adames.larry@gmail.com"

  def registration_confirmation(user)
    mail(to: user.email, subject: "Thanks for registering with ThermoTrack!")
  end
end
