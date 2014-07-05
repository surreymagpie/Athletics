class AddScoringMethodsToRaces < ActiveRecord::Migration
  def change
    change_table :races do |t|
      t.boolean :score_by_division, default: false
      t.boolean :score_by_category, default: false
    end
  end
end
