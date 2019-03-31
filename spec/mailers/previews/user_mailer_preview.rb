# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form('johndoe@example.com', 'John Doe', 'Hello World!')
  end

  def welcome
    user = User.first
    UserMailer.welcome(user)
  end

  def order_confirmation
    user = User.first
    UserMailer.order_confirmation(user, user.email)
  end
end
