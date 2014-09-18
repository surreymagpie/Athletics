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

  def get_divisions
    # returns all divisions which appear in the race, ignoring guests
    self.results.select('distinct division ').map(&:division).delete_if { |x| x == nil }.sort
  end

  def get_categories
    # returns all categories which appear in the race
    self.results.select('distinct category ').map(&:category).delete_if { |x| x == 'n/a' }.sort
  end
end
