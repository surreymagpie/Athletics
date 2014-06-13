require 'rails_helper'

describe Fixture do
  subject(:fixture) { season.fixtures.build(date: date, location: location, host: host) }
  let(:season) { Season.create(name: "Name") } 
  let(:location) { "Anywhere" }
  let(:host) { "Someone" }
  let(:date) { "01-05-2014" }

  describe "belongs to a season" do
    it {expect(subject).to respond_to(:season) }
  end

  context 'without a date' do
    let(:date) { "" } 
    it { expect(subject).to be_invalid }
  end
end