require 'rails_helper'

RSpec.describe Purchase, type: :model do
  let(:user) { User.create(name: 'Tom', email: 'tom@example.com', password: 'topsecret') }
  let(:valid_attributes) { { author: user, name: 'Apples', amount: 2 } }

  describe 'validations' do
    subject { Purchase.new(valid_attributes) }

    context 'name' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_length_of(:name).is_at_most(36) }
    end

    context 'amount' do
      it { is_expected.to validate_presence_of(:amount) }
      it { is_expected.to validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:author).class_name('User').with_foreign_key('author_id') }
    it { is_expected.to have_many(:group_purchases).dependent(:destroy) }
    it { is_expected.to have_many(:groups).through(:group_purchases) }
  end
end
