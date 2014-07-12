class Result < ActiveRecord::Base
  include Importable

  belongs_to :athlete
  belongs_to :race
  belongs_to :club
  has_one :fixture, through: :race

  scope :finish_order, -> {order('position ASC')}
  scope :categorised, -> (category) {where(category: category)}

  attr_accessor :bib, :str_time, :score

  before_create :convert_time
  before_create :find_athlete

  def formatted_time
    "#{sprintf("%02d", time/60)}:#{sprintf("%02d", time%60)}"
  end

  private

  def convert_time
    ms = str_time.split(':')
    self.time = ms[0].to_i*60 + ms[1].to_i
  end

  def find_athlete
      athlete = Athlete.find_by_bib(self.bib)
      self.athlete_id = athlete.id
      self.athlete_name = athlete.full_name
      self.club_id = athlete.club.id
      self.division = athlete.club.division
      self.category = athlete.category(self.fixture.date)
  end

  def self.import(file, race_id)
    return false unless file && s = import_spreadsheet(file)
    rows = s.parse(headers: true)
    rows[1..s.last_row].each do |row|
      result = find_or_initialize_by(race_id: race_id, position: row['position'].to_i)
      result.update(str_time: row['time'], bib: row['bib'].to_i)
    end
  end
end
