require 'rails_helper'

RSpec.describe "attendaces/new", type: :view do
  before(:each) do
    assign(:attendace, Attendace.new(
      private_number: "MyString"
    ))
  end

  it "renders new attendace form" do
    render

    assert_select "form[action=?][method=?]", attendaces_path, "post" do

      assert_select "input[name=?]", "attendace[private_number]"
    end
  end
end
