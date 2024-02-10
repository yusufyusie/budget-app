require 'rails_helper'

RSpec.describe 'When I open New Purchase page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tom', email: 'tom@example.com', password: 'topsecret')
    @user.confirm

    visit new_user_session_path
    fill_in 'Email', with: 'tom@example.com'
    fill_in 'Password', with: 'topsecret'
    click_button 'Log in'

    @group1 = Group.create(user: @user, name: 'Food', icon: 'https://i.pravatar.cc/300?img=13')
    @group2 = Group.create(user: @user, name: 'Cosmetics', icon: 'https://i.pravatar.cc/300?img=1')
    visit(new_group_purchase_path(@group1))
  end

  context 'shows the correct' do
    it 'heading' do
      expect(page).to have_content('new transaction')
    end

    it 'labels' do
      expect(page).to have_content('Name')
      expect(page).to have_content('Amount, $')
      expect(page).to have_content('Categories')
    end

    it 'existing groups' do
      expect(page).to have_content('Food')
      expect(page).to have_content('Cosmetics')
    end

    it 'placeholders' do
      expect(page).to have_css("input[placeholder='Bodyshop cream']")
      expect(page).to have_css("input[placeholder='15']")
    end

    it 'Add Transaction button' do
      expect(page).to have_button('Add Transaction', type: 'submit')
    end
  end

  context 'When I fill the fields and click on Add Transaction button' do
    before(:each) do
      fill_in 'Name', with: 'Coffee'
      fill_in 'Amount, $', with: '15'
      check 'Food'
      check 'Cosmetics'
      click_button('Add Transaction')
    end

    it "redirects me to that Group's Transactions list" do
      expect(page).to have_current_path(group_purchases_path(@group1))
    end

    it 'all checked Groups show the newly added Transaction' do
      expect(page).to have_content('Coffee')
      visit(group_purchases_path(@group2))
      expect(page).to have_content('Coffee')
    end
  end

  context 'When I click on Add Transaction button without filling the form' do
    before(:each) do
      click_button('Add Transaction')
    end

    it 'renders new page again' do
      expect(page).to have_content('new transaction')
      expect(page).to have_button('Add Transaction', type: 'submit')
    end

    it 'shows error message' do
      expect(page).to have_content('You must choose at least one category!')
    end
  end
end
