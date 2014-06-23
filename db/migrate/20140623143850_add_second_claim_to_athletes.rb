class AddSecondClaimToAthletes < ActiveRecord::Migration
  def change
    add_column :athletes, :second_claim, :boolean, default: false
  end
end
