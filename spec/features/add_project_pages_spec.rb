require 'rails_helper'

describe "the add a project to a skill page process" do
  it "adds a new project" do
    test_skill = Skill.create(:name => 'Rails', :description => 'An MVC framework')
    visit skills_path
    click_on 'Rails'
    click_on 'Add a Project'
    fill_in 'Name', :with => 'To do'
    fill_in 'Description', :with => 'Add lists and tasks to do'
    fill_in 'Link', :with => 'github.com/kimdangg/to_do'
    click_on 'Create Project'
    expect(page).to have_content 'To do'
  end
end
