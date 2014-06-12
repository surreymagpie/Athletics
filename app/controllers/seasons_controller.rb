class SeasonsController < ApplicationController
  before_action :find_season, only: [:show, :edit, :delete, :update, :destroy]

  def index
    @seasons = Season.all
  end

  def show
  end

  def new
    @season = Season.new
  end

  def create
    @season = Season.new(season_params)
    if @season.save
      flash[:success] = "Season created successfully"
      redirect_to seasons_path
    else
      flash[:error] = "Errors are present"
      render 'new'
    end
  end

  def edit
  end

  def delete
  end

  private

  def find_season
    @season = Season.find(params[:id])
  end

  def season_params
    params.require(:season).permit(:name)
  end
end
