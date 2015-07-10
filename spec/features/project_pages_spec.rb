require 'rails_helper'

describe "the add a project to a skill page process" do
  it "adds a new project" do
    admin_log_in
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

describe "the edit a project page process" do
  it "edit a project" do
    admin_log_in
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

describe "the delete a project page process" do
  it "delete a project" do
    admin_log_in
    test_skill = Skill.create(:name => 'Rails', :description => 'An MVC framework')
    test_project = test_skill.projects.create(:name => 'To Do', :description => 'Add lists and tasks to do', :link => 'github.com/kimdangg/to_do')
    visit skills_path
    click_on 'Rails'
    click_on 'To Do'
    click_on 'Delete'
    expect(page).to have_no_content 'To Do'
  end
end
