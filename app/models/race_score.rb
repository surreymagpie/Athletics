class RaceScore < ActiveRecord::Base
  belongs_to :club
  belongs_to :race


  def get_clubs(race)
    clubs = race.results.unscoped.select('distinct club_id').map(&:club_id)
    clubs.each do |club|
      
    end
  end
end
