require 'rails_helper'

describe "Importing result data" do
  before :each do
    visit import_results_path
    select 'Lightwater Country Park', from: 'Fixture'
    select 'U13 Girls', from: 'Race'
    attach_file :file, "lib/data/test_result.xlsx"
    click_button 'Submit'
  end

  context 'with valid data' do
    it { expect(page.status_code).to be(200) }  
  end
end