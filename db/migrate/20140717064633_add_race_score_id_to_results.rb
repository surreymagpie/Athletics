class AddRaceScoreIdToResults < ActiveRecord::Migration
  def change
    add_column :results, :race_score_id, :integer, index: true
  end
end
