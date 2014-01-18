require 'spec_helper'

describe PagesController do
  let(:user)       { create :user }
  let(:page)       { create :page }
  let(:admin_user) { create :user, role: 'admin' }

  describe '#index' do
    it 'redirect to sign in page' do
      get :index
      expect(response.header['Location']).to eq new_user_session_url
    end
    it 'returns 200' do
      sign_in user
      get :index
      expect(response.status).to eq 200
    end
  end

  describe '#show' do
    it 'redirect to sign in page' do
      get :show, id: page.page_name
      expect(response.header['Location']).to eq new_user_session_url
    end
    it 'returns 200' do
      sign_in user
      get :show, id: page.page_name
      expect(response.status).to eq 200
    end
  end

  describe '#new' do
    it 'redirect to sign in page' do
      get :new
      expect(response.header['Location']).to eq new_user_session_url
    end
    it 'returns 200' do
      sign_in user
      get :new
      expect(response.status).to eq 200
    end
  end

  describe '#edit' do
    it 'redirect to sign in page' do
      get :edit, id: page.page_name
      expect(response.header['Location']).to eq new_user_session_url
    end
    it 'returns 200' do
      sign_in user
      get :edit, id: page.page_name
      expect(response.status).to eq 200
    end
  end

  describe '#create' do
    it 'redirect to sign in page' do
      post :create, page: { raw_title: 'title', raw_body: 'body' }
      expect(response.header['Location']).to eq new_user_session_url
    end
    context 'with sign in' do
      before { sign_in user }
      it 'returns 302' do
        post :create, page: { raw_title: 'title', raw_body: 'body' }
        expect(response.status).to eq 302
      end
      it 'returns 200' do
        post :create, page: { raw_title: 'title' }
        expect(response.status).to eq 200
      end
    end
  end

  describe '#update' do
    it 'redirect to sign in page' do
      put :update, id: page.id, page: { raw_title: 'title', raw_body: 'body' }
      expect(response.header['Location']).to eq new_user_session_url
    end
    context 'with sign in' do
      before { sign_in user }
      it 'returns 302' do
        put :update, id: page.id, page: { raw_title: 'title', raw_body: 'body' }
        expect(response.status).to eq 302
      end
      it 'returns 200' do
        put :update, id: page.id, page: { raw_title: 'title', raw_body: '' }
        expect(response.status).to eq 200
      end
    end
  end

  describe '#destroy' do
    it 'redirect to sign in page' do
      delete :destroy, id: page.id
      expect(response.header['Location']).to eq new_user_session_url
    end
    context 'with sign in admin user' do
      before { sign_in admin_user }
      it 'returns 302' do
        delete :destroy, id: page.id
        expect(response.status).to eq 302
      end
    end
    context 'with sign in other user' do
      before { sign_in user }
      it 'raise CanCan::AccessDenied' do
        expect {
          delete :destroy, id: page.id
        }.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
