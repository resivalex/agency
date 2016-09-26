module Skillable
  extend ActiveSupport::Concern

  included do
    has_many :skill_holdings, as: :skillable
    has_many :skills, through: :skill_holdings

    scope :has_unmatched_skills, -> (skills) do
      joins(:skill_holdings).where.not(skill_holdings: { skill_id: skills.ids }).uniq
    end

    scope :matched_by_all_skills, -> (skills) do
      if skills.empty?
        all
      else
        joins(:skill_holdings).where(skill_holdings: { skill_id: skills.ids })
                              .having("COUNT(*) = ?", skills.count)
                              .group("#{table_name}.id")
      end
    end

    scope :matched_by_part_of_skills, -> (skills) do
      joins(:skill_holdings).where(skill_holdings: { skill_id: skills.ids })
                            .having("COUNT(*) < ?", skills.count)
                            .group("#{table_name}.id")
    end

    scope :has_full_subset_of_skills, -> (skills) do
      where.not(id: has_unmatched_skills(skills))
    end

    scope :has_partly_subset_of_skills, -> (skills) do
      joins(:skill_holdings).where(skill_holdings: { skill_id: skills.ids })
                            .where.not(id: has_full_subset_of_skills(skills)).uniq
    end

    def skills_line
      skills.pluck(:name).sort.join(', ')
    end
  end
end
