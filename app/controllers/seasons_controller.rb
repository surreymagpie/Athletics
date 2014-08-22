class SeasonsController < ApplicationController
  before_action :find_season, only: [:show, :edit, :delete, :update, :destroy]

  def index
    @seasons = Season.all
  end

  def show
    @fixtures = @season.fixtures
  end

  def new
    @season = Season.new
    CONFIG[:fixtures].times { @season.fixtures.build }
  end

  def create
    @season = Season.new(season_params)
    if @season.save
      flash[:success] = "Season created successfully"

      redirect_to season_path(@season)
    else
      flash[:alert] = "Errors are present"
      render 'new'
    end
  end

  def edit
    (CONFIG[:fixtures]-@season.fixtures.count).times { @season.fixtures.build }
  end

  def update
    if @season.update(season_params)
      flash[:success] = "Season updated successfully"
      redirect_to seasons_path
    else
      flash[:alert] = "Errors are present"
      render 'edit'
    end
  end

  def destroy
    s = @season.destroy
    flash[:notice] = "#{s.name} has been deleted from the database"
    redirect_to seasons_path
  end

  private

  def find_season
    @season = Season.includes(fixtures: [:races, :clubs]).find(params[:id])
  end

  def season_params
    params.require(:season).permit(:name, :fixtures_attributes => [:id, :date, :location, {:club_ids => []}, :_destroy])
  end
end
