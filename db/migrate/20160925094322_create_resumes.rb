class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :middle_name
      t.string :phone
      t.string :email
      t.integer :desired_salary
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
