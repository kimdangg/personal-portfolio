FactoryGirl.define do
  factory(:user) do
    username('peasant')
    email('peasant@rags.com')
    password('peasantspassword')
  end
end
