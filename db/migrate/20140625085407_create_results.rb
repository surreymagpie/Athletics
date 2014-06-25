class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :athlete, index: true
      t.references :race, index: true
      t.integer :position
      t.integer :time
      t.integer :division
      t.string :category
      t.string :club

      t.timestamps
    end
    add_index :results, :division
  end
end
