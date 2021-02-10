json.extract! employee, :id, :email, :name, :lastname, :position, :private_number, :active, :company_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
