admins = [
  { name: "Admin 1", last_name: "Admin Lastname 1", email: "admin1@email.com", password: "pass12345" },
  { name: "Admin 2", last_name: "Admin Lastname 2", email: "admin2@email.com", password: "pass12345" },
  { name: "Admin 3", last_name: "Admin Lastname 3", email: "admin3@email.com", password: "pass12345" },
]

admins.each { |admin|
  puts "Adding #{admin[:name]} #{admin[:last_name]} #{admin[:email]} #{admin[:password]}"
  admn = Admin.find_or_initialize_by(email: admin[:email])
    .update(
      name: admin[:name],
      last_name: admin[:last_name],
      password: admin[:password],
      password_confirmation: admin[:password],
    )
}

puts "#{Admin.count} of #{admins.size} Admins Created"