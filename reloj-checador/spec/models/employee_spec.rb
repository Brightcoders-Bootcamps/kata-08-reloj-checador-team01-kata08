require '../rails_helper'

RSpec.describe Employee, type: :model do
  it "is not valid without email attribute" do
    expect(Employee.new(:email => "")).to_not be_valid
  end

  it "is not valid without name attribute" do
    expect(Employee.new(:name => "")).to_not be_valid
  end

  it "is not valid without lastname attribute" do
    expect(Employee.new(:lastname => "")).to_not be_valid
  end

  it "is not valid without position attribute" do
    expect(Employee.new(:position => "")).to_not be_valid
  end

  it "is not valid without private number attribute" do
    expect(Employee.new(:private_number => "")).to_not be_valid
  end
end
