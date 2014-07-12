class Race < ActiveRecord::Base
  belongs_to :fixture
  has_one :season, through: :fixture
  has_many :clubs, through: :fixture
  has_many :results
  has_many :athletes, through: :results
  has_many :race_scores

  validates :fixture_id, :classification, presence: true

  scope :recent, -> { joins(:fixture).merge(Fixture.recent) }

  def full_race_name
    self.classification + ', ' + self.fixture.location
  end

  def self.get_divisions(race)
    # returns all divisions which appear in the race
    race.results.select('distinct division ').map(&:division)
  end

  def self.get_categories(race)
    # returns all categories which appear in the race
    race.results.select('distinct category ').map(&:category).delete_if { |x| x == 'n/a' }
  end
end
