class AddSalaryToVacancies < ActiveRecord::Migration
  def change
    change_table :vacancies do |t|
      t.integer :salary, null: false
    end
  end
end
