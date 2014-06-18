require 'rails_helper'

describe Athlete do
  let(:athlete) { Athlete.new(first_name: first_name, last_name: last_name, dob: dob, club_id: club_id) }
  let(:first_name) { "Becky" }
  let(:last_name) { "Hall" }
  let(:dob) { 30.years.ago }
  let(:club_id) { 1 }

  it { expect(athlete).to respond_to :first_name }
  it { expect(athlete).to respond_to :last_name }
  it { expect(athlete).to respond_to :club }
  it { expect(athlete).to respond_to :dob }
  it { expect(athlete).to respond_to :category }

  describe "are placed into the following age categories:" do
    context "U13s"
    let(:dob) { 11.years.ago } 
    it "should be categorised as U13" do
      expect(athlete.category(Date.today)).to eql("U13")
    end
  end
end
