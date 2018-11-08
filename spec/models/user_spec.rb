require 'rails_helper'

  describe User do
    context "User signs up" do

      it "is not valid without an email" do
        expect(User.new(password: "testers")).not_to be_valid
      end
    end
  end
