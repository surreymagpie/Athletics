class AthletesController < ApplicationController


  def new
    @athlete = Athlete.new
  end

  def create
    @athlete = Athlete.new(athlete_params)
    if @athlete.save
      flash[:success] = "Athlete added successfully"
      redirect_to athletes_path
    else
      flash[:success] = "Athlete added successfully"
      render 'new'
    end
  end

  private

  def athlete_params
    params.require(:athlete).permit(:first_name, :last_name, :dob, :club_id, :bib)
  end
end
