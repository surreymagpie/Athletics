class Club < ActiveRecord::Base
  validates :name, :abbr, presence: true
end
