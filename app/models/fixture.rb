class Fixture < ActiveRecord::Base
  belongs_to :season
  has_many :races, dependent: :destroy
  has_and_belongs_to_many :clubs

  validates :date, presence: true

  default_scope -> { order('date ASC') }

  after_create :create_races

  def create_races
    self.races.create(classification: "Senior Ladies")
    self.races.create(classification: "U17 / U15 Girls")
    self.races.create(classification: "U13 Girls")
  end
end
