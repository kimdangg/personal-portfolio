require 'rails_helper'

describe "the edit a project page process" do
  it "edit a project" do
    test_skill = Skill.create(:name => 'Rails', :description => 'An MVC framework')
    test_project = test_skill.projects.create(:name => 'To Do', :description => 'Add lists and tasks to do', :link => 'github.com/kimdangg/to_do')
    visit skills_path
    click_on 'Rails'
    click_on 'To Do'
    click_on 'Edit'
    fill_in 'Name', :with => 'Updated project'
    click_on 'Update Project'
    expect(page).to have_content 'Updated project'
  end
end
