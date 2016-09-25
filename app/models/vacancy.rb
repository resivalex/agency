class Vacancy < ActiveRecord::Base
  include Skillable

  validates :name, :expires_at, :phone, :email, :extra_contacts, :salary, presence: true

  scope :ordered, -> { order(salary: :desc) }
  scope :active, -> { where('expires_at > ?', Time.current.at_beginning_of_day) }

  def expires_date
    expires_at && expires_at.to_date
  end

  def fully_resumes
    Resume.matched_by_all_skills(skills).active.ordered
  end

  def partly_resumes
    Resume.matched_by_part_of_skills(skills).active.ordered
  end
end
