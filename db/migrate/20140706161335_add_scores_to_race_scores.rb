class AddScoresToRaceScores < ActiveRecord::Migration
  def up
    change_table :race_scores do |t|
      t.remove :score
      t.integer :total
      t.integer :scores, array: true
    end
  end

  def down
    change_table :race_scores do |t|
      t.remove :scores
      t.remove :total
      t.integer :score
    end    
  end
end
