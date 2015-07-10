FactoryGirl.define do
  factory(:user) do
    username('peasant')
    email('peasant@rags.com')
    password('peasantspassword')
  end

  factory(:post) do
    title('This is a title')
    body('Add body of blog post here')
  end
end
