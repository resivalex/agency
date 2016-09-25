class CreateSkillHoldings < ActiveRecord::Migration
  def change
    create_table :skill_holdings do |t|
      t.references :skillable, polymorphic: true, index: true
      t.references :skill

      t.timestamps null: false
    end
  end
end
