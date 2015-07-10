require 'rails_helper'

describe User do
  it { should validate_confirmation_of :password }
  it { should validate_uniqueness_of :email}
end
