require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'Tom', email: 'tom@example.com', password: 'topsecret') }
  let(:valid_attributes) { { user: user, name: 'Food', icon: 'missing_avatar.png' } }

  describe 'validations' do
    subject { Group.new(valid_attributes) }

    it { is_expected.to validate_presence_of(:user) }

    context 'name' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_length_of(:name).is_at_most(36) }
      it { is_expected.to validate_uniqueness_of(:name).scoped_to(:user_id).with_message('user already has this group') }
    end

    context 'icon' do
      it { is_expected.to validate_presence_of(:icon) }
      it { is_expected.to validate_length_of(:icon).is_at_most(250) }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:group_purchases).dependent(:destroy) }
    it { is_expected.to have_many(:purchases).through(:group_purchases) }
  end
end
