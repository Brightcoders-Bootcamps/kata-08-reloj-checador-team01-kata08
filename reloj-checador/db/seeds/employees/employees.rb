require "faker"

p "Creating Employees"

global_emp_count = 0

def get_private_number(count)
  return "00#{Employee.count + count}" if Employee.where(private_number: "00#{Employee.count + count}").count == 0
  get_private_number(Employee.count + count + 1)
end

Company.all.each { |company|
  (0..(rand 5..10)).each { |emp|
    global_emp_count += 1
    name = Faker::Name.unique.name
    employee = Employee.find_or_initialize_by(email: Faker::Internet.email)
                       .update(
                         email: Faker::Internet.email(name: name, separators: "_"),
                         name: name.split(" ")[0],
                         lastname: name.split(" ")[1],
                         position: Faker::Job.title,
                         private_number: get_private_number(Employee.count),
                         active: true,
                         company_id: company.id,
                       )
  }
}

p "Creating #{global_emp_count}/#{Employee.count} Employees"
