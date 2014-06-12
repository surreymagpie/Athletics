require 'rails_helper'

describe "Season Pages", :type => :request do
  describe "index" do
    let(:var) { Season.create(name: "2014") } 
    
    it "has a list of seasons" do
      var.save
      visit seasons_path
      expect(page).to have_selector('table') 
    end
  end
end
