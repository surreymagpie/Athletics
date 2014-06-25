class Club < ActiveRecord::Base

  include Importable

  validates :name, :abbr, presence: true
  before_save { self.abbr = abbr.to_s.upcase }
  has_and_belongs_to_many :fixtures
  has_many :races, through: :fixtures
  has_many :athletes, dependent: :destroy


  scope :alphabetical, -> { order('name ASC') }    
  scope :division, ->(div) { where(division: div) }

  def self.import(file)
    return false unless file && s = import_spreadsheet(file)
    rows = s.parse(headers: true)
    rows[1..s.last_row-1].each do |row|
      # check for changes to name or abbr
      name = find_by_name(row['name'])
      abbr = find_by_abbr(row['abbr'])
      # skip if everything is the same
      next if name && abbr && name.division == row['division']
      # use that club if one matches otherwise create a new one
      club = name || abbr
      club ||= new
      club.update_attributes(row)
    end
  end
end
