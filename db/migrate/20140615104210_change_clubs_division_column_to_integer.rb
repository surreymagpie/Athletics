class ChangeClubsDivisionColumnToInteger < ActiveRecord::Migration
  change_table :clubs do |t|
    t.remove :division
    t.integer :division
    t.index :division
  end
end
