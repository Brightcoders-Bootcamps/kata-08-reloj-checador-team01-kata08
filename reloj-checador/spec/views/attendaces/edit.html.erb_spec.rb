require 'rails_helper'

RSpec.describe "attendaces/edit", type: :view do
  before(:each) do
    @attendace = assign(:attendace, Attendace.create!(
      private_number: "MyString"
    ))
  end

  it "renders the edit attendace form" do
    render

    assert_select "form[action=?][method=?]", attendace_path(@attendace), "post" do

      assert_select "input[name=?]", "attendace[private_number]"
    end
  end
end
