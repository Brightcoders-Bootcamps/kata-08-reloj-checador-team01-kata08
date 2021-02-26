FactoryBot.define do
  company = FactoryBot.create(:company)
  factory :employee do
    email { "employee@user.com" }
    private_number { "0001" }
    name { "Mike" }
    lastname { "Wasoski" }
    position { "Lawyer" }
    active { true }
    company_id { company.id }
    # Add additional fields as required via your User model
    initialize_with {
      Employee.find_or_create_by(email: email,
                                 private_number: private_number,
                                 name: name,
                                 lastname: lastname,
                                 position: position,
                                 active: active,
                                 company_id: company_id)
    }
  end
end
