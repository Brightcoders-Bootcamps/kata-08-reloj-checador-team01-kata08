FactoryBot.define do
  factory :company do
    name { "Company test" }
    address { "Company test address" }
    initialize_with { Company.find_or_create_by(name: name, address: address) } 
    # Add additional fields as required via your User model
  end
end
