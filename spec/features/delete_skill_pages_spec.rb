require 'rails_helper'

describe "the delete a skill process" do
  it "delete a skill" do
    test_skill = Skill.create(:name => 'Rails', :description => 'An MVC framework')
    visit skills_path
    click_on 'Rails'
    click_on 'Delete'
    expect(page).to have_no_content 'Rails'
  end
end
