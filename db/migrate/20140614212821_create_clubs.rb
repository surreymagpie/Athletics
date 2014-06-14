class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :abbr
      t.string :contact
      t.string :email
      t.string :url
      t.string :division

      t.timestamps
    end
    add_index :clubs, [:division, :abbr]
  end
end
