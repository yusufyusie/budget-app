require 'rails_helper'

RSpec.describe 'When I open Purchases index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tom', email: 'tom@example.com', password: 'topsecret')
    @user.confirm

    visit new_user_session_path
    fill_in 'Email', with: 'tom@example.com'
    fill_in 'Password', with: 'topsecret'
    click_button 'Log in'

    @group1 = Group.create(user: @user, name: 'Food', icon: 'https://i.pravatar.cc/300?img=13')
    @group2 = Group.create(user: @user, name: 'Cosmetics', icon: 'https://i.pravatar.cc/300?img=1')
    @purchase1 = Purchase.create(name: 'Apples', amount: 6, author: @user, groups: [@group1])
    @purchase2 = Purchase.create(name: 'Bananas', amount: 4, author: @user, groups: [@group1])
    visit(group_purchases_path(@group1))
  end

  it 'shows the correct heading' do
    expect(page).to have_content('transactions')
  end

  it 'shows the name and amount of each purchase' do
    [@purchase1, @purchase2].each do |purchase|
      expect(page).to have_content(purchase.name)
      expect(page).to have_content("$#{purchase.amount}")
    end
  end

  it 'shows the created_at attribute of each purchase and the group' do
    expect(page).to have_content(Date.today.strftime('%d %b %Y'), count: 3)
  end

  it 'shows the total amount for the Group' do
    expect(page).to have_content('$10.0')
  end

  it 'shows the Add Transaction button' do
    expect(page).to have_link('add transaction', href: new_group_purchase_path(@group1))
  end

  context 'When I click on a Purchase name' do
    before(:each) do
      click_link(@purchase1.name)
    end

    it "redirects me to that Purchase's page" do
      expect(page).to have_current_path(group_purchase_path(@group1, @purchase1))
    end
  end

  context 'When I click on the Add Transaction button' do
    before(:each) do
      click_link('add transaction')
    end

    it 'redirects me to the form that adds a new Transaction' do
      expect(page).to have_current_path(new_group_purchase_path(@group1))
    end
  end
end
