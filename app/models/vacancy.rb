class Vacancy < ActiveRecord::Base
  include Skillable

  validates :name, :expires_at, :phone, :email, :extra_contacts, :salary, presence: true

  def expires_date
    expires_at && expires_at.to_s(:db).split(' ').first
  end
end
