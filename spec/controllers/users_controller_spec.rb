require 'rails_helper'

describe UsersController, type: :controller do

    let(:user) { User.create!(email: "testuser1@gmail.com", password: "1234567890") }
    let(:user2) { User.create!(email: "testuser2@gmail.com", password: "0234567891") }

    describe 'GET #show' do

      context 'when a user is logged in' do
        before do
          sign_in user
      end

      it 'loads correct user details' do
        get :show, params: { id: user.id }
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq user
      end

      it 'other users show page restricted' do
        get :show, params: { id: user2.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end


      context 'when a user is not logged in' do
        it 'redirects to login' do
          get :show, params: { id: user.id }
          expect(response).to redirect_to(new_user_session_path)
        end
      end
  end
  
end