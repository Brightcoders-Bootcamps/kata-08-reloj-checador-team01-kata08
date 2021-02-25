require '../rails_helper'

RSpec.describe Employee, type: :model do
  subject {
    described_class.new(email: "mail@example.com",
                        name: "Random name",
                        lastname: "Random lastname",
                        position: "Random position",
                        private_number: "12345")
  }

  it "is valid with all attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without email attribute" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without name attribute" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without lastname attribute" do
    subject.lastname = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without position attribute" do
    subject.position = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without private number attribute" do
    subject.private_number = nil
    expect(subject).to_not be_valid
  end
end
