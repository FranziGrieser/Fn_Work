# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'info@bikeberlin.com'
  layout 'mailer'
end
