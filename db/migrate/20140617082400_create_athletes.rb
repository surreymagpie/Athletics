class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.integer :bib
      t.references :club, index: true

      t.timestamps
    end
    add_index :athletes, :bib
  end
end
