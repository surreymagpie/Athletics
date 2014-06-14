class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :classification
      t.references :fixture, index: true

      t.timestamps
    end
  end
end
