class Resume < ActiveRecord::Base
  include Skillable

  def full_name
    "#{last_name} #{first_name} #{middle_name}".squish
  end
end
