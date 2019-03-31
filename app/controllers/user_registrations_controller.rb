# frozen_string_literal: true

class UserRegistrationsController < Devise::RegistrationsController
  def create
    super
    UserMailer.welcome(@user).deliver_now if @user.persisted?
  end
end
