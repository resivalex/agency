class AddNotNullToDesiredSalaryInResumes < ActiveRecord::Migration
  def change
    change_column_null :resumes, :desired_salary, false
  end
end
