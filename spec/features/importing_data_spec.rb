require "rails_helper"

feature "Importing club data" do
  before :each do
    visit clubs_path
    click_link "Import"
    attach_file "File", "/home/rob/Desktop/clubs.xlsx"
    click_button "Upload"
  end
  
  scenario "club data" do
    expect(page.status_code).to be(200)
  end

  scenario "increases the number of clubs" do
    expect{ Club.count }.to change()
  end
    
  scenario "shows any errors" do
      pending "reason"
  end
end