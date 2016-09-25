module Skillable
  extend ActiveSupport::Concern

  included do
    has_many :skill_holdings, as: :skillable
    has_many :skills, through: :skill_holdings

    def skills_line
      skills.pluck(:name).join(', ')
    end
  end
end
