class UserMailer < ApplicationMailer
  default from: "info@bikeberlin.com"

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

  def order_confirmation(user, email)
    @appname = "BikeBerlin"
    mail(to: user.email,
         subject: "Order Confirmation")
  end
end
