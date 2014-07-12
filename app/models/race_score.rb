class RaceScore < ActiveRecord::Base
  belongs_to :club
  belongs_to :race
end
