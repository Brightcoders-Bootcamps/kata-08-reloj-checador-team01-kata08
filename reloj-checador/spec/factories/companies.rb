FactoryBot.define do
  factory :company do
    id { 1 }
    name { "Company test" }
    address { "Company test address" }
    # Add additional fields as required via your User model
  end
end
