class Result < ActiveRecord::Base
  belongs_to :athlete
  belongs_to :race
  has_one :fixture, through: :race

  attr_accessor :bib, :str_time

  before_save :convert_time
  before_save :find_athlete

  def formatted_time
    "#{self.time/60}:#{self.time%60}"
  end

  private

  def convert_time
    ms = str_time.split(':')
    self.time = ms[0].to_i*60 + ms[1].to_i
  end

  def find_athlete
    athlete = Athlete.find_by_bib(self.bib)
    self.athlete_id = athlete.id
    self.club = athlete.club.abbr
    self.division = athlete.club.division
    self.category = athlete.category(self.fixture.date)
  end
end
