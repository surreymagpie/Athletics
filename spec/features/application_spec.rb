# Tests for the web page design
require 'rails_helper'

describe "Home page" do
  before(:each) {visit root_path}

  it "has a logo" do
    expect(page).to have_selector('#logo')
  end

  it "has the right title" do
    expect(page).to have_title('Home | Surrey Ladies XC League') 
  end

  it "has a footer" do
    expect(page).to have_selector('footer')    
  end

  it "has a link to the season index" do
    click_link "Seasons"
    expect(page).to  have_title('Seasons')
  end

  pending "until Clubs controller created" "has a link to the club index" do
    click_link "Clubs"
    expect(page).to  have_title('Clubs')
  end
  
  pending "until Athletes controller has been created" "has a link to the athlete index" do
    click_link "Athletes"
    expect(page).to  have_title('Athletes')
  end
end