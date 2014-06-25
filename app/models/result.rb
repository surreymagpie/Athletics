class Result < ActiveRecord::Base
  belongs_to :athlete
  belongs_to :race


  def formatted_time
    "#{self.time/60}:#{self.time%60}"
  end
end
