require 'spec_helper'

describe HomeController do
  describe '#index' do
    it 'returns 302' do
      get :index
      expect(response.status).to eq 302
    end
    context 'with sign in' do
      let(:user) { create :user }
      before { sign_in user }
      it 'returns 200' do
        get :index
        expect(response.status).to eq 200
      end
    end
  end
end
