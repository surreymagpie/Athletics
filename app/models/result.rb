class Result < ActiveRecord::Base
  belongs_to :athlete
  belongs_to :race
  has_one :fixture, through: :races


  def formatted_time
    "#{self.time/60}:#{self.time%60}"
  end
end
