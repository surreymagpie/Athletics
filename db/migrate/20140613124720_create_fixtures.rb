class CreateFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
      t.date :date
      t.string :location
      t.string :host
      t.references :season, index: true

      t.timestamps
    end
    add_index :fixtures, :date
  end
end
