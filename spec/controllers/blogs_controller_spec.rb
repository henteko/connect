require 'spec_helper'

describe BlogsController do
  let(:blog_owner)  { create :user }
  let(:blog_reader) { create :user }
  let(:blog)        { create :blog, user: blog_owner }

  describe '#index' do
    it 'redirect to sign in page' do
      get :index, username: blog_owner.username
      expect(response.header['Location']).to eq new_user_session_url
    end
    it 'returns 200' do
      sign_in blog_owner
      get :index, username: blog_owner.username
      expect(response.status).to eq 200
    end
  end

  describe '#show' do
    it 'redirect to sign in page' do
      get :show, username: blog_owner.username, id: blog.id
      expect(response.header['Location']).to eq new_user_session_url
    end
    it 'returns 200' do
      sign_in blog_owner
      get :show, username: blog_owner.username, id: blog.id
      expect(response.status).to eq 200
    end
  end

  describe '#new' do
    it 'redirect to sign in page' do
      get :new, username: blog_owner.username
      expect(response.header['Location']).to eq new_user_session_url
    end
    it 'returns 200' do
      sign_in blog_owner
      get :new, username: blog_owner.username
      expect(response.status).to eq 200
    end
  end

  describe '#edit' do
    it 'redirect to sign in page' do
      get :edit, username: blog_owner.username, id: blog.id
      expect(response.header['Location']).to eq new_user_session_url
    end
    context 'with sign in blog owner' do
      before { sign_in blog_owner }
      it 'returns 200' do
        get :edit, username: blog_owner.username, id: blog.id
        expect(response.status).to eq 200
      end
    end
    context 'with sign in other user' do
      before { sign_in blog_reader }
      it 'raise CanCan::AccessDenied' do
        expect {
          get :edit, username: blog_owner.username, id: blog.id
        }.to raise_error(CanCan::AccessDenied)
      end
    end
  end

  describe '#create' do
    it 'redirect to sign in page' do
      post :create, blog: { raw_title: 'title', raw_body: 'body' }
      expect(response.header['Location']).to eq new_user_session_url
    end
    context 'with sign in blog owner' do
      before { sign_in blog_owner }
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
    context 'with sign in blog owner' do
      before { sign_in blog_owner }
      it 'returns 302' do
        put :update, id: blog.id, blog: { raw_title: 'title', raw_body: 'body' }
        expect(response.status).to eq 302
      end
      it 'returns 200' do
        put :update, id: blog.id, blog: { raw_title: 'title', raw_body: '' }
        expect(response.status).to eq 200
      end
    end
    context 'with sign in other user' do
      before { sign_in blog_reader }
      it 'raise CanCan::AccessDenied' do
        expect {
          put :update, id: blog.id, blog: { raw_title: 'title', raw_body: 'body' }
        }.to raise_error(CanCan::AccessDenied)
      end
    end
  end

  describe '#history' do
    it 'redirect to sign in page' do
      get :history, username: blog_owner.username, id: blog.id
      expect(response.header['Location']).to eq new_user_session_url
    end
    it 'returns 200' do
      sign_in blog_owner
      get :history, username: blog_owner.username, id: blog.id
      expect(response.status).to eq 200
    end
  end

  describe '#destroy' do
    it 'redirect to sign in page' do
      delete :destroy, id: blog.id
      expect(response.header['Location']).to eq new_user_session_url
    end
    context 'with sign in blog owner' do
      before { sign_in blog_owner }
      it 'returns 200' do
        delete :destroy, id: blog.id
        expect(response.status).to eq 302
      end
    end
    context 'with sign in other user' do
      before { sign_in blog_reader }
      it 'raise CanCan::AccessDenied' do
        expect {
          delete :destroy, id: blog.id
        }.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
