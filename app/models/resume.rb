class Resume < ActiveRecord::Base
  include Skillable

  validates :first_name, :last_name, :phone, :email, :desired_salary, presence: true

  def full_name
    "#{last_name} #{first_name} #{middle_name}".squish
  end
end
