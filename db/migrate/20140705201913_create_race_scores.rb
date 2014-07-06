class CreateRaceScores < ActiveRecord::Migration
  def change
    create_table :race_scores do |t|
      t.references :club, index: true
      t.references :race, index: true
      t.string :team_name
      t.integer :score

      t.timestamps
    end
  end
end
