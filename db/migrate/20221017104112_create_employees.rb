class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :emp_name
      t.string :emp_email
      t.string :emp_job
      t.string :emp_salary

      t.timestamps
    end
  end
end
