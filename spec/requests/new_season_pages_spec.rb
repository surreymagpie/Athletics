require 'rails_helper'

describe "Creating a new season" do
  before :each do
    visit new_season_path
    fill_in "Name", with: "2014 season"
  end

  context 'without a fixture' do
    it "creates the season" do
      expect {click_button "Submit"}.to change(Season, :count).by(1)
    end

    it "does not create a fixture" do
      expect {click_button "Submit"}.to_not change(Fixture, :count)
    end
  end

  context 'with associated fixture' do
    before do 
      within('#fixture-0') do     
        fill_in "Date", with: "13/06/2014"
        fill_in "Location", with: "Richmond"
        fill_in "Host", with: "Ranelagh"
      end
    end

    it "also creates a fixture" do
      expect{click_button "Submit"}.to change(Fixture, :count).by(1)
    end
    
    it "congratulates you" do
      click_button "Submit"
      expect(page).to have_content('Season created successfully')
    end
  end
end