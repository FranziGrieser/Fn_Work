require 'rails_helper'

describe ProductsController, type: :controller do
  let(:user) {User.create!(email: 'user@testmail.com', password: 'testers')}
  let(:product) { Product.create!(name: "bike") }

  describe 'GET#index' do
    it 'renders the products index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  describe 'GET#show' do
    it 'renders the products show template' do
      get :show, params: { id: product.id }
      expect(response).to be_ok
    end
  end

  context "new products" do
    it 'can create product' do
      expect(Product.new(name: "Dirt Bike", description: "neat", color: "brown", price: "400")).to be_valid
    end

    it 'cannot create product without name' do
      expect(Product.new(name: nil)).not_to be_valid
    end
  end

end
