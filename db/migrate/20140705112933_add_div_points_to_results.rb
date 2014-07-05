class AddDivPointsToResults < ActiveRecord::Migration
  def change
    add_column :results, :div_points, :integer
  end
end
