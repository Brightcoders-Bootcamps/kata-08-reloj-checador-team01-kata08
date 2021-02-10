require 'rails_helper'

RSpec.describe "employees/index", type: :view do
  before(:each) do
    assign(:employees, [
      Employee.create!(
        email: "Email",
        name: "Name",
        lastname: "Lastname",
        position: "Position",
        private_number: "Private Number",
        active: false,
        company: nil
      ),
      Employee.create!(
        email: "Email",
        name: "Name",
        lastname: "Lastname",
        position: "Position",
        private_number: "Private Number",
        active: false,
        company: nil
      )
    ])
  end

  it "renders a list of employees" do
    render
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Lastname".to_s, count: 2
    assert_select "tr>td", text: "Position".to_s, count: 2
    assert_select "tr>td", text: "Private Number".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
