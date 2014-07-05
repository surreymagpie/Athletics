class AddDivPointsToResults < ActiveRecord::Migration
  def change
    add_column :results, :points, :integer
  end
end
