json.extract! employee, :id, :emp_name, :emp_email, :emp_job, :emp_salary, :created_at, :updated_at
json.url employee_url(employee, format: :json)
