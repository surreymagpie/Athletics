require 'rails_helper'

describe "Creating a new season" do
  context 'with associated fixture' do
    before do
      visit new_season_path
      fill_in "Name", with: "2014 season"
      fill_in "0_date", with: "13/06/2014"
      fill_in "Location", with: "Richmond"
      fill_in "Host", with: "Ranelagh"      
    end

    
    it {expect(click_link "Submit").to change(Season, :count).by(1)}

    it "also creates a fixture" do
      expect(click_link "Submit").to change(Fixture, :count).by(1)
    end

    it {expect(page).to have_content('Season created successfully')}

  end
end