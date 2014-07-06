class AddClubIdToResults < ActiveRecord::Migration
  def up
    change_table :results do |t|
      t.remove :club
      t.references :club, index: true
    end
  end

  def down
    change_table :results do |t|
      t.remove :club_id
      t.string :club
    end
  end
end
