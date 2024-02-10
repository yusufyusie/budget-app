require 'rails_helper'

RSpec.describe GroupPurchase, type: :model do
  let(:user) { User.create(name: 'Tom', email: 'tom@example.com', password: 'topsecret') }
  let(:purchase) { Purchase.create(author: user, name: 'Apples', amount: 2) }
  let(:group) { Group.create(user:, name: 'Food', icon: 'missing_avatar.png') }

  describe 'associations' do
    it { is_expected.to belong_to(:group) }
    it { is_expected.to belong_to(:purchase) }
  end
end
