class AthletesController < ApplicationController
  before_action :find_athlete, only: [:show, :edit, :delete, :update, :destroy]

  def new
    @athlete = Athlete.new
  end

  def create
    @athlete = Athlete.new(athlete_params)
    if @athlete.save
      flash[:success] = "Athlete added successfully"
      redirect_to athletes_path
    else
      flash[:error] = "Errors are present"
      render 'new'
    end
  end

  def index
    @athletes = Athlete.all
  end

  def update
    if @athlete.update(athlete_params)
      flash[:success] = "Athlete update successfully"
      redirect_to athletes_path
    else
      flash[:error] = "Errors are present"
      render 'edit'
    end
  end

  def destroy
    a = @athlete.destroy
    flash[:notice] = "#{a.full_name} has been deleted"
    redirect_to athletes_path
  end

  private

  def athlete_params
    params.require(:athlete).permit(:first_name, :last_name, :dob, :club_id, :bib)
  end

  def find_athlete
    @athlete = Athlete.find(params[:id])
  end
end
