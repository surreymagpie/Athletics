require "rails_helper"

feature "Importing club data" do
  let(:file) {   "/home/rob/Desktop/clubs.xlsx" } 

  before :each do
    visit clubs_path
    click_link "Import"
    attach_file "file", file
  end
  
  scenario "club data" do
    click_button "Upload" 
    expect(page.status_code).to be(200)
  end

  scenario "increases the number of clubs" do
    expect{click_button "Upload"}.to change{ Club.count }
  end
  
  feature "with no file or wrong file type" do  
    let(:file) { nil } 
    scenario "displays an error" do
      click_button "Upload"
      expect(page).to have_content{ "Invalid file chosen" }
    end
  end
end

feature "Importing athlete data" do
  let(:file) {   "/home/rob/Desktop/Book1.xlsx" } 

  before :each do
    visit athletes_path
    click_link "Import"
    attach_file "file", file
  end
  
  scenario "succeeds" do
    click_button "Upload" 
    expect(page.status_code).to be(200)
  end

  scenario "increases the number of clubs" do
    expect{click_button "Upload"}.to change{ Athlete.count }
  end
  
  feature "with no file or wrong file type" do  
    let(:file) { nil } 
    scenario "displays an error" do
      click_button "Upload"
      expect(page).to have_content{ "Invalid file chosen" }
    end
  end
end