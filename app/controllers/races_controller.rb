class RacesController < ApplicationController
  def show
    @race = Race.includes(:results => [:athlete => :club]).find(params[:id])
  end

  def score
    race = Race.includes(:results).find(params[:id])
    divisions = get_divisions(race) if race.score_by_division?
    categories = get_categories(race) if race.score_by_category?
    if divisions && categories
      divisions.each do |div|
        categories.each do |cat|
          score_race race, division: div, category: cat
        end
      end      
    elsif divisions
      divisions.each do |div|
        score_race race, division: div
      end
    elsif categories
      categories.each do |cat|
        score_race race, category: cat
      end
    else
      score_race race
    end
    redirect_to race_path(params[:id])
  end

  def score_race(race, options = {} )
    results = race.results.where(options)
    set_points(results)
    team_points(race, results, options)
  end

  def set_points(results)
    points = 1    
    results.finish_order.each do |r|
      r.update_attributes(points: points)
      points += 1
    end
  end

  def team_points(race, results, options = {} )
    club_ids = results.select('distinct club_id').map(&:club_id)
    category = options[:category] || nil
    club_ids.each do |club_id|
      scores = results.finish_order.where(club_id: club_id).map(&:points).in_groups_of(race.scorers, results.size+10)
      suffix = 'A'
      scores.each do |score|
        team_name = [Club.find(club_id).abbr, category, suffix].join(' ')
        RaceScore.find_or_create_by(race_id:race.id, team_name: team_name).update_attributes(club_id: club_id, scores: score, total: score.sum)
        suffix = suffix.next
      end
    end
  end
end
