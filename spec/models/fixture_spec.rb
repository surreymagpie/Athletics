require 'rails_helper'

describe Fixture do
  subject(:fixture) { season.fixtures.build(date: date, location: location) }
  let(:season) { Season.create(name: "Name") } 
  let(:location) { "Anywhere" }
  let(:date) { "01-05-2014" }

  it {expect(subject).to respond_to(:season) }
  it {expect(subject).to respond_to(:races) }
  it {expect(subject).to respond_to(:clubs) }

  context 'without a date' do
    let(:date) { "" } 
    it { expect(subject).to be_invalid }
  end
end