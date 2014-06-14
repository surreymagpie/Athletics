class Fixture < ActiveRecord::Base
  belongs_to :season

  validates :date, presence: true

  scope :date_order, -> { order('date ASC') }
end
