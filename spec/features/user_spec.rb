require 'spec_helper'

feature 'on the landing page' do
  scenario 'a user can login to see their profile page' do
    user = User.create(email: 'team@greg.com', password: 'password', password_confirmation: 'password')

    visit '/'
    fill_in 'login[email]', with: 'team@greg.com'
    fill_in 'login[password]', with: 'password'
    click_button 'login'


    expect(current_path).to eq user_path(user)
  end

  scenario 'a person can link to the new user page' do
    visit '/'
    click_link 'signup'
    expect(current_path).to eq new_user_path
  end
end
