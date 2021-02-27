require "rails_helper"

RSpec.describe Admin, type: :model do
  subject {
    described_class.new(id: 01, 
                        name: "Lorem ipsum", 
                        last_name: "Lorem ipsum", 
                        created_at: Time.now(), 
                        updated_at: Time.now(), 
                        email: "anything@gmail.com",
                        password: "abc12345")
  }
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without id attribute" do
    admin = Admin.new(id: nil)
    expect(admin).to_not be_valid
  end

  it "is not valid without name attribute" do
    admin = Admin.new(name: nil)
    expect(admin).to_not be_valid
  end

  it "is not valid without last_name attribute" do
    admin = Admin.new(last_name: nil)
    expect(admin).to_not be_valid
  end

  it "is not valid without created_at attribute" do
    admin = Admin.new(created_at: nil)
    expect(admin).to_not be_valid
  end

  it "is not valid without update_at attribute" do
    admin = Admin.new(updated_at: nil)
    expect(admin).to_not be_valid
  end

  it "is not valid without email attribute" do
    admin = Admin.new(email: nil)
    expect(admin).to_not be_valid
  end

  it "is not valid without password attribute" do
    admin = Admin.new(password: nil)
    expect(admin).to_not be_valid
  end
end
