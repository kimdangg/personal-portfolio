require 'rails_helper'

describe "the edit a skill process" do
  it "edit a skill" do
    test_skill = Skill.create(:name => 'Rails', :description => 'An MVC framework')
    visit skills_path
    click_on 'Rails'
    click_on 'Edit'
    fill_in 'Name', :with => 'Rails!!!'
    click_on 'Update Skill'
    expect(page).to have_content 'Rails!!!'
  end
end
