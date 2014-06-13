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
end