require 'rails_helper'

RSpec.describe "attendaces/show", type: :view do
  before(:each) do
    @attendace = assign(:attendace, Attendace.create!(
      private_number: "Private Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Private Number/)
  end
end
