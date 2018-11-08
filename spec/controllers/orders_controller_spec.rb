require 'rails_helper'

describe OrdersController, type: :controller do
  let(:user) {User.create!(email: 'user@testmail.com', password: 'testers')}

  context 'unauthenticated user' do
    it "redirects to login" do
      get :show, params: {id: user.id}
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
