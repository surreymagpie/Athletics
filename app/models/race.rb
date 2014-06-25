class Race < ActiveRecord::Base
  belongs_to :fixture
  has_one :season, through: :fixture
  has_many :clubs, through: :fixture
  has_many :results
  has_many :athletes, through: :results

  validates :fixture_id, :classification, presence: true

  scope :recent, -> { joins(:fixture).merge(Fixture.recent) }

  def full_race_name
    self.classification + ', ' + self.fixture.location
  end
end
