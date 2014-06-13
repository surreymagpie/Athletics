require 'rails_helper'

describe Fixture do
  subject(:fixture) { Fixture.new(date: Date.today, location: location, host: host, season_id: season.id) }
  let(:season) { Season.create(name: "Name") } 
  let(:location) { "Anywhere" }
  let(:host) { "Someone" }

  describe "belongs to a season" do
    it {expect(subject).to respond_to(:season) }
  end
end