class Vacancy < ActiveRecord::Base
  include Skillable

  validates :name, :expires_at, :phone, :email, :extra_contacts, :salary, presence: true
end
