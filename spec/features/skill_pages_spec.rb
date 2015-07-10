require 'rails_helper'

def admin_log_in
  test_admin = FactoryGirl.create(:user, :email => "admin@gmail.com")
  test_admin.update(:admin? => true)
  visit '/'
  click_on 'login'
  fill_in 'Email', :with => "admin@gmail.com"
  fill_in 'Password', :with => 'peasantspassword'
  click_on 'session-login'
end

describe "the add a skill process" do
  it "adds a new skill" do
    admin_log_in
    visit new_skill_path
    fill_in 'Name', :with => 'Rails'
    fill_in 'Description', :with => 'An MVC framework'

    click_on 'Create Skill'
    expect(page).to have_content 'Rails'
  end
end

describe "the delete a skill process" do
  it "delete a skill" do
    admin_log_in
    test_skill = Skill.create(:name => 'Rails', :description => 'An MVC framework')
    visit skills_path
    click_on 'Rails'
    click_on 'Delete'
    expect(page).to have_no_content 'Rails'
  end
end

describe "the edit a skill process" do
  it "edit a skill" do
    admin_log_in
    test_skill = Skill.create(:name => 'Rails', :description => 'An MVC framework')
    visit skills_path
    click_on 'Rails'
    click_on 'Edit'
    fill_in 'Name', :with => 'Rails!!!'
    click_on 'Update Skill'
    expect(page).to have_content 'Rails!!!'
  end
end
