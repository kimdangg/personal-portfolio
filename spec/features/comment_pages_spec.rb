require 'rails_helper'

def user_log_in
  test_user = FactoryGirl.create(:user)
  visit '/'
  click_on 'login'
  fill_in 'Email', :with => 'peasant@rags.com'
  fill_in 'Password', :with => 'peasantspassword'
  click_on 'session-login'
end

describe "the add a new comment to the blog" do
  it "adds a new post" do
    test_post = FactoryGirl.create(:post)
    user_log_in
    visit '/'
    click_on 'BLOG'
    click_on test_post.title
    fill_in 'Body', :with => 'This is the first comment.'
    click_on 'submit'
    expect(page).to have_content "Your comment has been added!"
  end
end
