require 'rails_helper'
require 'capybara/rspec'

RSpec.describe ClubsController, type: :feature do
  describe "Clubs index" do
    before { visit clubs_path }
    it "groups clubs by division" do
      expect(page).to have_selector('#div1')
      expect(page).to have_selector('#div2')
    end
  end  
end