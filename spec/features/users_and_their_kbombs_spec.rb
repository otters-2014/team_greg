require 'spec_helper'

feature 'on the user\'s profile page' do
  scenario 'a user can see another user\'s information' do
    user = User.create(first_name: 'first', last_name: 'last', email: 'team@greg.com', password: 'password', password_confirmation: 'password')
    visit user_path(user)
    expect(page).to have_content user.first_name
    expect(page).to have_content user.last_name
  end

  scenario 'a user can see their own kbombs' do
    user = User.create(first_name: 'first', last_name: 'last', email: 'team@greg.com', password: 'password', password_confirmation: 'password')
    user.kbombs << Kbomb.create(name: 'Rails', description: 'A ruby web framework!')
    visit user_path(user)
    expect(page).to have_content 'Rails'
  end

  xscenario 'a user can see a link to remove a Kbomb' do
    user = User.create(first_name: 'first', last_name: 'last', email: 'team@greg.com', password: 'password', password_confirmation: 'password')
    user.kbombs << Kbomb.create(name: 'Rails', description: 'A ruby web framework!')
    visit user_path(user)
    expect(page).to have_content 'x'
  end

  scenario 'a user cannot see another user\'s add Kbomb button' do
    user = User.create(first_name: 'first', last_name: 'last', email: 'team@greg.com', password: 'password', password_confirmation: 'password')
    visit user_path(user)
    expect(page).to_not have_content 'Add Kbomb!'
  end

  scenario 'any user can see that user\'s kbombs' do
    kbomb1 = Kbomb.create(name: 'name 1')
    kbomb2 = Kbomb.create(name: 'name 2')
    user = User.create(first_name: 'first', last_name: 'last', email: 'team@greg.com', password: 'password', password_confirmation: 'password')
    user.kbombs << kbomb1 << kbomb2

    visit user_path(user)
    expect(page).to have_content kbomb1.name
    expect(page).to have_content kbomb2.name
  end
end
