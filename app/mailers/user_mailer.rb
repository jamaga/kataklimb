class UserMailer < ActionMailer::Base
  default from: ""

  def welcome(user)
    @user = user

    mail to: "#{@user.name} <#{@user.email}>", subject: "Welcome to the KataKlimb"
  end
end
