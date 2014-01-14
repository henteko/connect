require 'spec_helper'

describe UsersController do
  let(:user) { create :user }

  describe '#edit' do
    it 'redirect to sign in page' do
      get :edit
      expect(response.header['Location']).to eq new_user_session_url
    end
    it 'returns 200' do
      sign_in user
      get :edit
      expect(response.status).to eq 200
    end
  end

  describe '#update' do
    it 'redirect to sign in page' do
      put :update, user: { username: 'username', email: 'email' }
      expect(response.header['Location']).to eq new_user_session_url
    end
    context 'with sign in' do
      before { sign_in user }
      it 'returns 302' do
        put :update, user: { username: 'username', email: user.email }
        expect(response.status).to eq 302
      end
      it 'returns 200' do
        put :update, user: { username: 'username', email: '' }
        expect(response.status).to eq 200
      end
    end
  end
end
