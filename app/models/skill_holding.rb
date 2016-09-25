class SkillHolding < ActiveRecord::Base
  belongs_to :skillable, polymorphic: true
  belongs_to :skill
end
