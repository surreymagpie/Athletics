require 'rails_helper'

describe Result, :type => :model do
  before :each do
    club = FactoryGirl.create :club
    athlete = FactoryGirl.create :athlete, bib: 100, club_id: club.id
    fixture = FactoryGirl.create :fixture
  end
  subject { Result.new(position: position, time: time, athlete_id: Athlete.find_by_bib(bib).id ) } 
  let(:position) { 1 } 
  let(:time) { 730 } 
  let(:bib) { 100 } 

  it { expect(subject).to respond_to :position }
  it { expect(subject).to respond_to :time }
  it { expect(subject).to respond_to :formatted_time }
  it { expect(subject).to respond_to :athlete }
  it { expect(subject).to respond_to :race }
  it { expect(subject).to respond_to :fixture }

end
