require '../rails_helper'

RSpec.describe Company, type: :model do
  it "is not valid without name attribute" do
    expect(Company.new(:name => nil)).to_not be_valid
  end
  it "is not valid without address attribute" do
    expect(Company.new(:address => nil)).to_not be_valid
  end
  describe "submit" do
    @comp = Company.new(:name => "mycompani", :address=>"myaddresstest 5")
    @comp.submit
  end
  
end
