class AddScorersToRaces < ActiveRecord::Migration
  def change
    add_column :races, :scorers, :integer
  end
end
