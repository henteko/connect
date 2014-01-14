require 'spec_helper'

describe AdminController do
  let(:admin_user) { create(:user, role: 'admin') }
  let(:user)       { create(:user) }

  describe '#notification' do
    it 'redirect to sign in page' do
      get :notification
      expect(response.header['Location']).to eq new_user_session_url
    end
    context 'with sign in user' do
      before { sign_in user }
      it 'return 404 status' do
        get :notification
        expect(response.status).to eq 404
      end
    end
    context 'with sign in admin user' do
      before { sign_in admin_user }
      it 'return 200 status' do
        get :notification
        expect(response.status).to eq 200
      end
    end
  end
end
