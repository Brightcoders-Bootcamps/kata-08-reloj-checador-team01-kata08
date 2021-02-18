require "faker"

p "Creating companies"

(0..4).each { |c|
  company = Company.find_or_initialize_by(name: Faker::Company.name)
    .update(
      address: Faker::Address.street_address,
    )
}

puts "#{Admin.count} of 5 Companies Created"
