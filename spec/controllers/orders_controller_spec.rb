require 'rails_helper'

describe OrdersController, type: :controller do
#  let(:user) {User.create!(email: 'user@testmail.com', password: 'testers')}

  before do
    @user = FactoryBot.build(:user)
  end

  context 'unauthenticated user' do
    it "redirects to login" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
