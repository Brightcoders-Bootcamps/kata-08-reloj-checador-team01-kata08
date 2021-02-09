require 'rails_helper'

RSpec.describe "attendaces/index", type: :view do
  before(:each) do
    assign(:attendaces, [
      Attendace.create!(
        private_number: "Private Number"
      ),
      Attendace.create!(
        private_number: "Private Number"
      )
    ])
  end

  it "renders a list of attendaces" do
    render
    assert_select "tr>td", text: "Private Number".to_s, count: 2
  end
end
