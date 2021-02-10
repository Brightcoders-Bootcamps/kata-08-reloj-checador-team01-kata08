require 'rails_helper'

RSpec.describe "employees/new", type: :view do
  before(:each) do
    assign(:employee, Employee.new(
      email: "MyString",
      name: "MyString",
      lastname: "MyString",
      position: "MyString",
      private_number: "MyString",
      active: false,
      company: nil
    ))
  end

  it "renders new employee form" do
    render

    assert_select "form[action=?][method=?]", employees_path, "post" do

      assert_select "input[name=?]", "employee[email]"

      assert_select "input[name=?]", "employee[name]"

      assert_select "input[name=?]", "employee[lastname]"

      assert_select "input[name=?]", "employee[position]"

      assert_select "input[name=?]", "employee[private_number]"

      assert_select "input[name=?]", "employee[active]"

      assert_select "input[name=?]", "employee[company_id]"
    end
  end
end
