require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_attributes) { { name: 'John Doe', email: 'john@example.com', password: 'password' } }
  let(:no_name) { { email: 'john@example.com', password: 'password' } }
  let(:name_too_long) { { name: 'A' * 36, email: 'john@example.com', password: 'password' } }

  context '#create' do
    it 'is valid with valid attributes' do
      expect(User.create(valid_attributes)).to be_valid
    end

    it 'is not valid without a name' do
      expect(User.create(no_name)).to_not be_valid
    end

    it 'is not valid with a name longer than 35 characters' do
      expect(User.create(name_too_long)).to_not be_valid
    end
  end

  context '#associations' do
    let(:user) { User.create(valid_attributes) }
    let(:purchase) { Purchase.create(author: user, name: 'Apples', amount: 2) }
    let(:group) { Group.create(user: user, name: 'Food', icon: 'missing_avatar.png') }

    it 'has many purchases' do
      expect(user.purchases).to include(purchase)
    end

    it 'has many groups' do
      expect(user.groups).to include(group)
    end

    it 'deletes associated purchases when deleted' do
      user.destroy
      expect(Purchase.find_by(id: purchase.id)).to be_nil
    end

    it 'deletes associated groups when deleted' do
      user.destroy
      expect(Group.find_by(id: group.id)).to be_nil
    end
  end
end
