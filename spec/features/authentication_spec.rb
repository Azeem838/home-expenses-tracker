require 'rails_helper'

feature 'sign up process' do
  scenario 'has a new user sign up page' do
    visit new_user_registration_path
    expect(page).to have_content 'Sign up'
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_registration_path
      fill_in 'Username', with: 'testing_username'
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'cake,biscuitsandtea'
      fill_in 'Password confirmation', with: 'cake,biscuitsandtea'
      first(:button, 'Sign up').click
    end

    scenario 'redirects to root path after signup' do
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
  end
end

feature 'sign in process' do
  scenario 'has a new user session' do
    visit new_user_session_path
    expect(page).to have_content 'Login'
  end

  feature 'signing in a user' do
    before(:each) do
      @user = User.create(username: 'hello', email: 'hello@example.com', password: 'password')
      visit new_user_session_path
      fill_in 'Your Email', with: 'hello@example.com'
      fill_in 'Your Password', with: 'password'
      first(:button, 'Log in').click
    end

    scenario 'redirects to root path after signup' do
      expect(page).to have_content 'Signed in successfully.'
    end
  end
end
