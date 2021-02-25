require '../rails_helper'

RSpec.describe Attendace, type: :model do
  subject {
    described_class.new(private_number: "12345")
  }

  it "is valid with all attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without private number attribute" do
    subject.private_number = nil
    expect(subject).to_not be_valid
  end
end
