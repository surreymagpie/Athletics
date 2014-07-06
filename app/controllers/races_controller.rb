class RacesController < ApplicationController
  def show
    @race = Race.includes(:results => [:athlete, :club]).find(2)
    @results = @race.results.finish_order
    @race_scores = @race.race_scores.order('total ASC')
  end

  def score
    race = Race.includes(:results).find(params[:id])
    if race.score_by_division?
      divisions = race.results.select('distinct division ').map(&:division)
      divisions.each do |div|
        results = race.results.where('division = ?', div)
        score_results(results)
      end
    elsif race.score_by_category?
      categories = race.results.select('distinct category ').map(&:category)
      categories.each do |category|
        next if category == 'n/a'
        results = race.results.finish_order.categorised(category)
        score_results(results)
        clubs = results.unscoped.where(race_id: race.id, category: category).select('distinct club_id').map(&:club_id)
        clubs.each do |club_id|
          scores = results.where(race_id: race.id, club_id: club_id).map(&:points).in_groups_of(race.scorers, results.size+10)
          suffix = 'A'
          scores.each do |score|
            RaceScore.create(race_id:race.id, club_id: club_id, scores: score, total: score.sum, team_name: Club.find(club_id).abbr + " #{category} " + suffix)
            suffix = suffix.next            
          end          
        end   
      end     
    else
      results = race.results.finish_order
      score_results(results)
    end
    redirect_to race_path(params[:id])
  end


  private

  def score_results(results)
    score = 1    
    results.each do |r|
      r.update_attributes(points: score)
      score += 1
    end
  end

  def team_scores(race)
      club.results.categorised('U17').map(&:points).in_groups_of(race.scorers, race.results.categorised('U17').size+10)
  end
end
