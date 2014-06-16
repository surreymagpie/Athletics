class RemoveHostFromFixtures < ActiveRecord::Migration
  def up
    change_table :fixtures do |t|
      t.remove :host
    end
  end
  
  def down
    change_table :fixtures do |t|
      t.string :host
    end
  end
end
