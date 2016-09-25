class AddNotNullToExpiresInVacancies < ActiveRecord::Migration
  def change
    change_column_null :vacancies, :expires_at, false
  end
end
