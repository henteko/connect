require 'spec_helper'

describe WikisController do
  let(:user) { create :user }

  describe '#index' do
    it 'returns 404' do
      get :index
      expect(response.status).to eq 404
    end
    it 'returns 200' do
      sign_in user
      get :index
      expect(response.status).to eq 200
    end
  end

  describe '#show' do
    let(:wiki) { create :wiki }
    it 'returns 404' do
      get :show, id: wiki.id
      expect(response.status).to eq 404
    end
    it 'returns 200' do
      sign_in user
      get :show, id: wiki.id
      expect(response.status).to eq 200
    end
  end

  describe '#new' do
    it 'returns 404' do
      get :new
      expect(response.status).to eq 404
    end
    it 'returns 200' do
      sign_in user
      get :new
      expect(response.status).to eq 200
    end
  end

  describe '#edit' do
    let(:wiki) { create :wiki }
    it 'returns 404' do
      get :edit, id: wiki.id
      expect(response.status).to eq 404
    end
    it 'returns 200' do
      sign_in user
      get :edit, id: wiki.id
      expect(response.status).to eq 200
    end
  end

  describe '#create' do
    it 'returns 404' do
      post :create, wiki: { raw_title: 'title', raw_body: 'body' }
      expect(response.status).to eq 404
    end
    context 'with sign in' do
      before { sign_in user }
      it 'returns 302' do
        post :create, wiki: { raw_title: 'title', raw_body: 'body' }
        expect(response.status).to eq 302
      end
      it 'returns 200' do
        post :create, wiki: { raw_title: 'title' }
        expect(response.status).to eq 200
      end
    end
  end

  describe '#update' do
    let(:wiki) { create :wiki }
    it 'returns 404' do
      patch :update, id: wiki.id, wiki: { raw_title: 'title', raw_body: 'body' }
      expect(response.status).to eq 404
    end
    context 'with sign in' do
      before { sign_in user }
      it 'returns 302' do
        patch :update, id: wiki.id, wiki: { raw_title: 'title', raw_body: 'body' }
        expect(response.status).to eq 302
      end
      it 'returns 200' do
        patch :update, id: wiki.id, wiki: { raw_title: 'title' }
        expect(response.status).to eq 302
      end
    end
  end

  describe '#destroy' do
    let(:wiki) { create :wiki }
    it 'returns 404' do
      delete :destroy, id: wiki.id
      expect(response.status).to eq 404
    end
    it 'returns 200' do
      sign_in user
      delete :destroy, id: wiki.id
      expect(response.status).to eq 302
    end
  end
end
