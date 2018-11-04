class UserMailer < ApplicationMailer
  default from: "franzi.grieser@yahoo.de"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'franzi.grieser@yahoo.de',
         subject: "A new contact form message from #{name}")
  end

  def welcome(user)
     @appname = "BikeBerlin"
     mail(to: user.email,
          subject: "Welcome to #{@appname}!")
  end
end
