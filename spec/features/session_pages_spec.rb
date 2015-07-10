require 'rails_helper'

describe 'logging in successfully' do
  it 'displays a link to a login page on the index' do
    test_user = FactoryGirl.create(:user)
    visit '/'
    click_on 'login'
    fill_in 'Email', :with => 'peasant@rags.com'
    fill_in 'Password', :with => 'peasantspassword'
    click_on 'session-login'
    expect(page).to have_content "Login success!"
  end
end

describe 'logging in unsuccessfully' do
  it 'displays a link to a login page on the index' do
    test_user = FactoryGirl.create(:user)
    visit '/'
    click_on 'login'
    fill_in 'Email', :with => 'peasant@rags.com'
    fill_in 'Password', :with => 'rubbish'
    click_on 'session-login'
    expect(page).to have_content 'There was a problem logging you in.'
  end
end

describe 'logging out successfully' do
  it 'displays a link to a logout page on the index' do
    test_user = FactoryGirl.create(:user)
    visit '/'
    click_on 'login'
    fill_in 'Email', :with => 'peasant@rags.com'
    fill_in 'Password', :with => 'peasantspassword'
    click_on 'session-login'
    click_on 'logout'
    expect(page).to have_content 'You\'ve been logged out successfully.'
  end
end
