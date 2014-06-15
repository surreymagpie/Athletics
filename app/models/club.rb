class Club < ActiveRecord::Base
  validates :name, :abbr, presence: true
  before_save { self.abbr = abbr.upcase }


  scope :alphabetical, -> { order('name ASC') }    
  scope :division_one, -> { where('division = 1') }
  scope :division_two, -> { where('division = 2') }
end
