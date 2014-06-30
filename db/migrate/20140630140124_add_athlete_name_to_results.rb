class AddAthleteNameToResults < ActiveRecord::Migration
  def change
    change_table :results do |t|
      t.string :athlete_name
    end
  end
end
