class RaceScore < ActiveRecord::Base
  belongs_to :club
  belongs_to :race
  has_many :results


  def get_scores(penalty)
    scores = results.finish_order.collect(&:points)
    if scores.size < race.scorers
      scores += Array.new(race.scorers - scores.size, penalty)
    end
    self.scores = scores
    self.total = scores.sum
  end
end
