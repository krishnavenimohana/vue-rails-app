require "rails_helper"

RSpec.describe Record, :type => :model do
  it "is valid with valid attributes" do
    user = User.create!(email: "krishnavenimohana@gmail.com", password: "123456", password_confirmation: "123456")
    record = Record.new(title: "Title", year: "year", user_id: user.id)
    expect(record).to be_valid
  end

  it "is not valid without a title and year" do
    record = Record.new(title: nil, year: nil, user_id: nil)
    expect(record).to_not be_valid
  end
end
