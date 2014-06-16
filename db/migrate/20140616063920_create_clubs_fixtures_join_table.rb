class CreateClubsFixturesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :clubs, :fixtures do |t|
      t.index [:club_id, :fixture_id]
      # t.index [:fixture_id, :club_id]
    end
  end
end
