require 'spec_helper'

describe LinksController do
  let(:user) { create :user }
  let(:link) { create :link }

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
      get :edit, id: link.id
      expect(response.header['Location']).to eq new_user_session_url
    end
    it 'returns 200' do
      sign_in user
      get :edit, id: link.id
      expect(response.status).to eq 200
    end
  end

  describe '#create' do
    it 'redirect to sign in page' do
      post :create, link: { title: 'title', url: 'url' }
      expect(response.header['Location']).to eq new_user_session_url
    end
    context 'with sign in' do
      before { sign_in user }
      it 'returns 302' do
        post :create, link: { title: 'title', url: 'url' }
        expect(response.status).to eq 302
      end
      it 'returns 200' do
        post :create, link: { title: 'title' }
        expect(response.status).to eq 200
      end
    end
  end

  describe '#update' do
    it 'redirect to sign in page' do
      put :update, id: link.id, link: { title: 'title', url: 'url' }
      expect(response.header['Location']).to eq new_user_session_url
    end
    context 'with sign in' do
      before { sign_in user }
      it 'returns 302' do
        put :update, id: link.id, link: { title: 'title', url: 'url' }
        expect(response.status).to eq 302
      end
      it 'returns 200' do
        put :update, id: link.id, link: { title: 'title', url: '' }
        expect(response.status).to eq 200
      end
    end
  end

  describe '#destroy' do
    it 'redirect to sign in page' do
      delete :destroy, id: link.id
      expect(response.header['Location']).to eq new_user_session_url
    end
    it 'returns 200' do
      sign_in user
      delete :destroy, id: link.id
      expect(response.status).to eq 302
    end
  end
end
