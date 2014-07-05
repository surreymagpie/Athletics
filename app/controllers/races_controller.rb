class RacesController < ApplicationController
  def show
    @race = Race.includes(:results =>[:athlete => :club]).find(params[:id])
  end

  def score
    divisions = Array(1..2)
    divisions.each do |div|
      score = 1
      results = Race.find(params[:id]).results.where('division=?', div)
      results.each do |r|
        r.div_points = score
        score += 1
        r.save
      end
    end
    redirect_to race_path(params[:id])
  end
end
