require 'rails_helper'

describe "Importing result data" do
  before :each do
    club = FactoryGirl.create :club
    FactoryGirl.create :fixture
    FactoryGirl.create :athlete, club_id: club.id
    visit import_results_path
    fixture = fixture
    select 'Richmond Park', from: 'results_fixture_id'
    select 'U13 Girls', from: 'results_race_id'
    attach_file :file, "lib/data/test_result.xlsx"
    click_button 'Upload'
  end

  context 'with valid data' do
    it { expect(page.status_code).to be(200) }
  end
end