require 'rails_helper'

describe "the delete a project page process" do
  it "delete a project" do
    test_skill = Skill.create(:name => 'Rails', :description => 'An MVC framework')
    test_project = test_skill.projects.create(:name => 'To Do', :description => 'Add lists and tasks to do', :link => 'github.com/kimdangg/to_do')
    visit skills_path
    click_on 'Rails'
    click_on 'To Do'
    click_on 'Delete'
    expect(page).to have_no_content 'To Do'
  end
end
