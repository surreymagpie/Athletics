require 'rails_helper'

describe "Importing result data" do
  before :each do
    FactoryGirl.create :fixture
    FactoryGirl.create :athlete, club_id: (FactoryGirl.create :club).id    
    visit import_results_path
    select 'Richmond Park', from: 'results_fixture_id'
    select 'U13 Girls', from: 'results_race_id'
    attach_file :file, "lib/data/test_result.xlsx"
    click_button 'Upload'
  end

  context 'with valid data' do
    it { expect(page.status_code).to be(200) }
  end
end