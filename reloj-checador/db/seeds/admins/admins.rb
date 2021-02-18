require "faker"


admins = [
  {email: "admin1@email.com", password: "pass12345" },
  {email: "admin2@email.com", password: "pass12345" },
  {email: "admin3@email.com", password: "pass12345" },
]

admins.each { |admin|
  puts "Adding #{admin[:email]} #{admin[:password]}"
  admn = Admin.find_or_initialize_by(email: admin[:email])
    .update(
      name: Faker::Name.name,
      last_name: Faker::Name.last_name,
      password: admin[:password],
      password_confirmation: admin[:password],
    )
}

puts "#{Admin.count} of #{admins.size} Admins Created"