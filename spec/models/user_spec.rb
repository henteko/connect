require 'spec_helper'

describe User do
  it { should have_many :blogs }
  it { should have_many :pages }
  it { should validate_presence_of :email }

  let(:admin_user) { create(:user, role: 'admin') }
  let(:user)       { create(:user) }
  describe '#admin?' do
    context 'when user role is admin' do
      it { expect(admin_user.admin?).to be_true }
    end
    context 'when user role is nil' do
      it { expect(user.admin?).to be_false }
    end
  end
end
