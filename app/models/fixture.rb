class Fixture < ActiveRecord::Base
  belongs_to :season

  validates :date, presence: true
end
