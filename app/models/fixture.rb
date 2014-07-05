class Fixture < ActiveRecord::Base
  belongs_to :season
  has_many :races, dependent: :destroy
  has_and_belongs_to_many :clubs

  validates :date, presence: true

  default_scope -> { order('date ASC') }
  scope :recent, ->{ where('date BETWEEN ? AND ?', 3.months.ago, Date.today) }

  after_create :create_races

  def create_races
    self.races.create(classification: "Senior Ladies", scorers: 5)
    self.races.create(classification: "U17 / U15 Girls", scorers: 4)
    self.races.create(classification: "U13 Girls", scorers: 4)
  end

  def location_date
    location + ' - ' + date.strftime('%d/%m/%Y') 
  end
end
