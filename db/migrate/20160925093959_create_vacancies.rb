class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :name, null: false
      t.string :phone
      t.string :email
      t.string :extra_contacts
      t.timestamp :expires_at

      t.timestamps null: false
    end
  end
end
