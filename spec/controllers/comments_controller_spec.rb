# frozen_string_literal: true

require 'rails_helper'

describe CommentsController, type: :controller do
  #  let(:user) {User.create!(email: 'user@testmail.com', password: 'testers')}
  #  let(:product) { Product.create!(name: "bike") }

  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
  end

  context 'when user is logged in' do
    before do
      sign_in @user
    end

    it 'can create comments' do
      post :create, params: { product_id: @product.id, comment: { body: 'fantastic', rating: 5 } }
      expect(response).to have_http_status(302)
    end
  end
end
