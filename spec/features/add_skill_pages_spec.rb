require 'rails_helper'

describe "the add a skill process" do
  it "adds a new skill" do
    visit new_skill_path
    fill_in 'Name', :with => 'Rails'
    fill_in 'Description', :with => 'An MVC framework'

    click_on 'Create Skill'
    expect(page).to have_content 'Rails'
  end
end
