require 'rails_helper'

feature 'create a expense' do
  before(:each) do
    sign_in FactoryBot.create(:user)
    @group = FactoryBot.create(:group)
    visit all_expenses_path
  end

  scenario 'is on the all expenses page' do
    visit all_expenses_path
    expect(page).to have_content 'All Expenses'
  end

  feature 'create a new expense' do
    before(:each) do
      click_on 'Add new'
      fill_in 'Name', with: 'TestExpense'
      fill_in 'Amount', with: '10'
      click_on 'Submit'
    end

    scenario 'renders expense section on the post' do
      expect(page).to have_content 'TestExpense'
    end
  end

  feature 'create a new expense with invalid params' do
    before(:each) do
      click_on 'Add new'
      fill_in 'Name', with: ''
      click_on 'Submit'
    end

    scenario "renders name can't be black error" do
      expect(page).to have_content "Name can't be blank"
    end
  end
end
