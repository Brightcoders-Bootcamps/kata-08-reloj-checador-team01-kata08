dates_arr = (Date.current - 1.month...Date.current + 1.month).to_a.map { |date| date.to_s }

emp_arr = Employee.all.pluck(:private_number)
global_emp_count = 0
p "Creating Attendaces"

dates_arr.each { |date|
  private_numbers = emp_arr.sample(1 + rand(emp_arr.count)).uniq.sort
  date_in = DateTime.strptime(date + " #{rand(12..15)}:#{rand(10..59)}:#{rand(10..59)}", "%Y-%m-%d %H:%M:%S")
  date_out = date_in + rand(1..8).hours
  private_numbers.each { |private_number|
    global_emp_count += 2
    attendace_in = Attendace.new(
      private_number: private_number,
      date: date_in.strftime("%Y-%m-%d"),
      time: date_in.strftime("%H:%M:%S"),
      check_type: "IN",
    )
    attendace_in.save
    attendace_out = Attendace.new(
      private_number: private_number,
      date: date_out.strftime("%Y-%m-%d"),
      time: date_out.strftime("%H:%M:%S"),
      check_type: "OUT",
    )
    attendace_out.save
  }
}

p "Created #{global_emp_count}/#{Attendace.count} Attendaces"
