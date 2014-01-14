require 'spec_helper'

describe BlogsController do
  let(:user) { create :user }
  let(:blog) { create :blog, user: user }

  describe '#index' do
    it 'redirect to sign in page' do
      get :index, username: user.username
      expect(response.header['Location']).to eq new_user_session_url
    end
    it 'returns 200' do
      sign_in user
      get :index, username: user.username
      expect(response.status).to eq 200
    end
  end

  describe '#show' do
    it 'redirect to sign in page' do
      get :show, username: user.username, id: blog.id
      expect(response.header['Location']).to eq new_user_session_url
    end
    it 'returns 200' do
      sign_in user
      get :show, username: user.username, id: blog.id
      expect(response.status).to eq 200
    end
  end

  describe '#new' do
    it 'redirect to sign in page' do
      get :new, username: user.username
      expect(response.header['Location']).to eq new_user_session_url
    end
    it 'returns 200' do
      sign_in user
      get :new, username: user.username
      expect(response.status).to eq 200
    end
  end

  describe '#edit' do
    it 'redirect to sign in page' do
      get :edit, username: user.username, id: blog.id
      expect(response.header['Location']).to eq new_user_session_url
    end
    it 'returns 200' do
      sign_in user
      get :edit, username: user.username, id: blog.id
      expect(response.status).to eq 200
    end
  end

  describe '#create' do
    it 'redirect to sign in page' do
      post :create, blog: { raw_title: 'title', raw_body: 'body' }
      expect(response.header['Location']).to eq new_user_session_url
    end
    context 'with sign in' do
      before { sign_in user }
      it 'returns 302' do
        post :create, blog: { raw_title: 'title', raw_body: 'body' }
        expect(response.status).to eq 302
      end
      it 'returns 200' do
        post :create, blog: { raw_title: 'title' }
        expect(response.status).to eq 200
      end
    end
  end

  describe '#update' do
    it 'redirect to sign in page' do
      put :update, id: blog.id, blog: { raw_title: 'title', raw_body: 'body' }
      expect(response.header['Location']).to eq new_user_session_url
    end
    context 'with sign in' do
      before { sign_in user }
      it 'returns 302' do
        put :update, id: blog.id, blog: { raw_title: 'title', raw_body: 'body' }
        expect(response.status).to eq 302
      end
      it 'returns 200' do
        put :update, id: blog.id, blog: { raw_title: 'title', raw_body: '' }
        expect(response.status).to eq 200
      end
    end
  end

  describe '#history' do
    it 'redirect to sign in page' do
      get :history, username: user.username, id: blog.id
      expect(response.header['Location']).to eq new_user_session_url
    end
    it 'returns 200' do
      sign_in user
      get :history, username: user.username, id: blog.id
      expect(response.status).to eq 200
    end
  end

  describe '#destroy' do
    it 'redirect to sign in page' do
      delete :destroy, id: blog.id
      expect(response.header['Location']).to eq new_user_session_url
    end
    it 'returns 200' do
      sign_in user
      delete :destroy, id: blog.id
      expect(response.status).to eq 302
    end
  end
end
