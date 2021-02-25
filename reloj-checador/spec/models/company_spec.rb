require '../rails_helper'

RSpec.describe Company, type: :model do

  subject {
    described_class.new(name: "Anything",
                        address: "Lorem ipsum")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without name attribute" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without address attribute" do
    subject.address = nil
    expect(subject).to_not be_valid
  end
  
end
