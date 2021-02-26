FactoryBot.define do
  factory :attendace do
    private_number { "0001" }
    check_type { "IN" }
    # Add additional fields as required via your User model
  end
end
