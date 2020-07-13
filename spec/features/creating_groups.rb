require 'rails_helper'

feature 'create a group' do
  before(:each) do
    sign_in FactoryBot.create(:user)
    @expense = FactoryBot.create(:expense)
    visit all_groups_path
  end

  scenario 'is on the all groups page' do
    visit all_groups_path
    expect(page).to have_content 'Your Groups'
  end

  feature 'create a new group' do
    before(:each) do
      first(:link, 'New Group').click
      fill_in 'group_name', with: 'TestGroup'
      click_on 'Submit'
    end

    scenario 'renders group show page' do
      expect(page).to have_content 'TestGroup'
    end
  end

  feature 'create a new group with invalid params' do
    before(:each) do
      first(:link, 'New Group').click
      fill_in 'Name', with: ''
      click_on 'Submit'
    end

    scenario "renders name can't be black error" do
      expect(page).to have_content "Name can't be blank"
    end
  end
end
