require 'rails_helper'

describe 'successfully creating a new user' do
  it 'displays a link to a login page on the index' do
    visit '/'
    click_on 'sign-up'
    fill_in 'Username', :with => 'thypeasant'
    fill_in 'Email', :with => 'thypeasant@rags.com'
    fill_in 'Password', :with => 'badpassword'
    fill_in 'Password confirmation', :with => 'badpassword'
    click_on 'new-user'
    expect(page).to have_content "Thank you for signing up!"
  end
end

describe 'unsuccessfully creating a new user (password mismatch)' do
  it 'displays a link to a login page on the index' do
    visit '/'
    click_on 'sign-up'
    fill_in 'Username', :with => 'thypeasant'
    fill_in 'Email', :with => 'peasant@gmail.com'
    fill_in 'Password', :with => 'badpassword'
    fill_in 'Password confirmation', :with => 'badpassword2'
    click_on 'new-user'
    expect(page).to have_content 'There was a problem creating your account. Please try again.'
  end
end

describe 'unsuccessfully creating a new user (user already exists)' do
  it 'displays a link to a login page on the index' do
    test_user = FactoryGirl.create(:user)
    visit '/'
    click_on 'sign-up'
    fill_in 'Username', :with => 'thypeasant'
    fill_in 'Email', :with => 'peasant@rags.com'
    fill_in 'Password', :with => 'badpassword'
    fill_in 'Password confirmation', :with => 'badpassword'
    click_on 'new-user'
    expect(page).to have_content 'There was a problem creating your account. Please try again.'
  end
end

describe 'user trying to access admin features' do
  it 'displays a warning message to the user trying to access admin pages' do
    visit '/skills/new'
    expect(page).to have_content "You are not authorized to perform this action."
  end
end
