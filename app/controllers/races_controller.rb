class RacesController < ApplicationController
  def show
    @race = Race.includes(:results =>[:athlete => :club]).find(params[:id])
  end
end
