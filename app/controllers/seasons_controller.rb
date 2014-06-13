class SeasonsController < ApplicationController
  before_action :find_season, only: [:show, :edit, :delete, :update, :destroy]

  def index
    @seasons = Season.all
  end

  def show
  end

  def new
    @season = Season.new
    4.times { @season.fixtures.build }
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
    (4-@season.fixtures.count).times { @season.fixtures.build }
  end

  def update
    if @season.update(season_params)
      flash[:success] = "Season upated successfully"
      redirect_to seasons_path
    else
      flash[:error] = "Errors are present"
      render 'edit'
    end
  end

  def delete
  end

  def destroy
    s = @season.destroy
    flash[:notice] = "#{s.name} has been deleted from the database"
    redirect_to seasons_path
  end

  private

  def find_season
    @season = Season.find(params[:id])
  end

  def season_params
    params.require(:season).permit(:name, :fixtures_attributes => [:id, :date, :location, :host, :_destroy])
  end
end
