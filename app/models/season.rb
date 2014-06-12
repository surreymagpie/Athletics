class Season < ActiveRecord::Base
  validates :name, presence: true
end
