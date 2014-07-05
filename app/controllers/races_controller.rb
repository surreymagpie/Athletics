class RacesController < ApplicationController
  def show
    @race = Race.includes(:results =>[:athlete => :club]).find(params[:id])
  end

  def score
    race = Race.includes(:results).find(params[:id])
    if race.score_by_division?
      divisions = race.results.unscoped.select('distinct division ').map(&:division)
      divisions.each do |div|
        results = race.results.where('division = ?', div)
        score_results(results)
      end
    elsif race.score_by_category?
      categories = race.results.unscoped.select('distinct category ').map(&:category)
      categories.each do |category|
        next if category == 'n/a'
        results = race.results.where('category = ?', category)
        score_results(results)
      end     
    else
      results = race.results
      score_results(results)
    end
    redirect_to race_path(params[:id])
  end


  private

  def score_results(results)
    score = 1    
    results.each do |r|
      r.points = score
      score += 1
      r.save
    end
  end
end
