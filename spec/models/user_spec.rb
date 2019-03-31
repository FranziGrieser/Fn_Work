# frozen_string_literal: true

require 'rails_helper'

describe User do
  context 'User signs up' do
    it 'is not valid without an email' do
      @user = FactoryBot.build(:user, email: 'not_an_email')
      expect(@user).to_not be_valid
    end
  end
end
