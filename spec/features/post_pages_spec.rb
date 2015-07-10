require 'rails_helper'

describe "the add a new post to the blog" do
  it "adds a new post" do
    admin_log_in
    visit '/posts/new'
    fill_in 'Title', :with => 'First Post'
    fill_in 'Body', :with => 'This is the body to the post.'
    click_on 'submit-post'
    expect(page).to have_content "Your entry has been successfully added."
  end
end
