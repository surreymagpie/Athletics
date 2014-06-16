class Race < ActiveRecord::Base
  belongs_to :fixture
  has_one :season, through: :fixture
  has_many :clubs, through: :fixture

  validates :fixture_id, :classification, presence: true
end
