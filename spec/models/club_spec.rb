require 'rails_helper'

describe Club do
  subject(:club) { Club.new(name: name, abbr: abbr, division: division) }
  let(:name) { "Club" }
  let(:abbr) { "CLB" }
  let(:division) { 1 }

  it { expect(subject).to respond_to(:name) }
  it { expect(subject).to respond_to(:abbr) }
  it { expect(subject).to respond_to(:division) }

  context "without name" do
    let(:name) { "" }
    it { expect(subject).to be_invalid }
  end

  context "without abbr" do
    let(:abbr) { "" }
    it { expect(subject).to be_invalid }
  end
end