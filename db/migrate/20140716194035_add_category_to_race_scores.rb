class AddCategoryToRaceScores < ActiveRecord::Migration
  def change
    change_table :race_scores do |t|
      t.string :category, index: true
    end
  end
end
