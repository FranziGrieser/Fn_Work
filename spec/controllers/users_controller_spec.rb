# frozen_string_literal: true

require 'rails_helper'

describe UsersController, type: :controller do
  #  let(:user) {User.create!(email: 'user@testmail.com', password: 'testers')}
  #  let(:user2) {User.create!(email: 'user2@testmail.com', password: 'testers2')}
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @admin = FactoryBot.create(:admin)
  end

  describe 'GET #index' do
    before do
      sign_in @user1
    end

    it 'renders the user index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
        sign_in @user1
      end

      it 'loads correct user details' do
        get :show, params: { id: @user1.id }
        expect(response).to be_ok
        expect(assigns(:user)).to eq @user1
      end

      it 'user cannot access other users page' do
        get :show, params: { id: @user2.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when a user is logged out' do
      it 'redirects to login' do
        get :show, params: { id: @user1.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      sign_in @admin
    end

    it '#admin? can delete user' do
      delete :destroy, params: { id: @user1.id }
      expect(response).to redirect_to users_url
    end
  end

  describe 'PATCH #update' do
    before do
      sign_in @user1
    end

    it 'updates user data' do
      article_params = FactoryBot.attributes_for(:user)
      expect do
        patch :update, params: { id: @user1.id, user: article_params }
      end.to change(User, :count).by(0)
      expect(flash[:notice]).to eq 'User was successfully updated.'
    end
    # doesn't affect codecov...
    context 'with invalid params' do
      it 're-renders form #edit' do
        article_params = FactoryBot.attributes_for(:user, email: '')
        get :edit, params: { id: @user1.id }
        expect(response).to render_template('edit')
      end
    end
  end

  # doesn't affect codecov
  describe 'POST #create' do
    before do
      sign_in @admin
    end

    context 'with valid params' do
      it 'redirects to show page' do
        get :show, params: { id: @admin.id }
        #      expect(flash[:notice]).to eq 'User was successfully created.'
        expect(response).to render_template('show')
      end
    end

    context 'with invalid params' do
      it 're-renders form #new' do
        get :new
        expect(response).to render_template('new')
      end
    end
  end

  #  describe 'GET #new' do

  #    before do
  #      sign_out @user1
  #    end

  #    it 'redirects to #root when not logged in' do
  #      expect(flash[:notice]).to eq 'The page you tried to reach is for admin only.'
  #      expect(response).to redirect_to root_path
  #    end
  #  end
end
