class RacesController < ApplicationController
  def show
    @race = Race.includes(:results => [:athlete => :club]).find(params[:id])
  end

  def score
    race = Race.includes(:results).find(params[:id])
    divisions = race.get_divisions if race.score_by_division?
    categories = race.get_categories if race.score_by_category?
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
    penalty = results.size + 10
    club_ids.each do |club_id|
      grouped_results = results.finish_order.where(club_id: club_id).in_groups_of(race.scorers, false)
      suffix = 'A'
      grouped_results.each do |res|
        team_name = [Club.find(club_id).abbr, suffix].join(' ')
        rs = RaceScore.find_or_create_by(race_id:race.id, team_name: team_name)
        rs.results = res
        rs.get_scores(penalty)
        rs.update(club_id: club_id, category: category)
        suffix = suffix.next
      end
    end
  end
end
