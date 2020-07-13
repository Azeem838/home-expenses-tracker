require 'rails_helper'

feature 'create a expense with a group' do
  before(:each) do
    sign_in FactoryBot.create(:user)
    @group = FactoryBot.create(:group)
    @expense = FactoryBot.create(:expense)
    visit user_path(:user)
  end

  scenario 'is on the all root page' do
    expect(page).to have_content @group.name
  end

  feature 'add a group to an expense' do
    before(:each) do
      visit group_path(@group)
    end

    scenario 'renders ungrouped expenses on the page' do
      expect(page).to have_selector(:link_or_button, 'Add')
    end
  end

  feature 'add to the group' do
    before(:each) do
      visit group_path(@group)
      click_on 'Add'
    end

    scenario 'renders current group path' do
      expect(page).to have_selector(:link_or_button, 'Remove')
    end
  end
end
