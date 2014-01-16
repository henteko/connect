require 'spec_helper'

describe Admin::NotificationsController do
  let(:admin_user) { create(:user, role: 'admin') }
  let(:user)       { create(:user) }

  describe '#show' do
    it 'redirect to sign in page' do
      get :show
      expect(response.header['Location']).to eq new_user_session_url
    end
    context 'with sign in user' do
      before { sign_in user }
      it 'return 404 status' do
        get :show
        expect(response.status).to eq 404
      end
    end
    context 'with sign in admin user' do
      before { sign_in admin_user }
      it 'return 200 status' do
        get :show
        expect(response.status).to eq 200
      end
    end
  end

  describe '#update' do
    it 'redirect to sign in page' do
      put :update
      expect(response.header['Location']).to eq new_user_session_url
    end
    context 'with sign in user' do
      before { sign_in user }
      it 'return 404 status' do
        put :update
        expect(response.status).to eq 404
      end
    end
    context 'with sign in admin user' do
      let(:notification) { create(:notification) }
      before { sign_in admin_user }
      it 'returns 302 status' do
        put :update, id: notification.id, hipchat: { token: 'token', room_name: 'room_name' }
        expect(response.status).to eq 302
      end
      it 'return 200 status' do
        put :update, id: notification.id, hipchat: { token: 'token', room_name: '' }
        expect(response.status).to eq 200
      end
    end
  end
end
