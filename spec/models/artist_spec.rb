require "rails_helper"

RSpec.describe Artist, :type => :model do

  it "is valid with valid attributes" do
    artist = Artist.new(name: "name")
    expect(artist).to be_valid
  end

  it "is not valid without a name" do
    artist = Artist.new(name: nil)
    expect(artist).to_not be_valid
  end
end
