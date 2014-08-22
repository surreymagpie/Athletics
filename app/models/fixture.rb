class Fixture < ActiveRecord::Base
  belongs_to :season
  has_many :races, dependent: :destroy
  has_and_belongs_to_many :clubs

  validates :date, presence: true

  default_scope -> { order('date ASC') }
  scope :recent, ->{ where('date BETWEEN ? AND ?', 3.months.ago, Date.today) }

  after_create :create_races

  def create_races
    CONFIG[:races].each do |race|
      self.races.create(race)
    end
  end

  def location_date
    location + ' - ' + date.strftime('%d/%m/%Y') 
  end
end
