require "rails_helper"

RSpec.describe User, :type => :model do

  it "is valid with valid attributes" do
    user = User.new(email: "krishnavenimohana@gmail.com", password: "123456", password_confirmation: "123456")
    expect(user).to be_valid
  end

  it "is not valid without a email and year" do
    user = User.new(email: nil, password: nil)
    expect(user).to_not be_valid
  end
end
