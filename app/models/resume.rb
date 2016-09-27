class Resume < ActiveRecord::Base
  include Skillable

  validates :first_name, :last_name, :phone, :email, :desired_salary, presence: true

  scope :ordered, -> { order(desired_salary: :asc) }
  scope :active, -> { where(is_active: true) }

  def full_name
    "#{last_name} #{first_name} #{middle_name}".squish
  end

  def fully_vacancies
    Vacancy.has_full_subset_of_skills(skills).active.ordered
  end

  def partly_vacancies
    Vacancy.has_partly_subset_of_skills(skills).active.ordered
  end

  def as_json(*args)
    super(*args).merge(skills_line: skills_line, full_name: full_name)
  end
end
