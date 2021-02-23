require '../rails_helper'

RSpec.describe Attendace, type: :model do
  it "is not valid without private number attribute" do
    expect(Attendace.new(:private_number => "")).to_not be_valid
  end
end
