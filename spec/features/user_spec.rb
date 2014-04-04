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

feature 'on the sign-up page' do
  scenario 'a user can create a profile' do

    visit '/users/new'
    fill_in 'user[first_name]', with: 'Tony'
    fill_in 'user[last_name]', with: 'Ta'
    fill_in 'user[email]', with: 'team@greg.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'

    expect{click_button 'signup'}.to change(User,:count).by(1)

    user = User.find_by(email: 'team@greg.com')
    expect(current_path).to eq user_path(user.id)
  end

end
