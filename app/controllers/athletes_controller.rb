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
      flash[:alert] = "Errors are present"
      render 'new'
    end
  end

  def index
    respond_to do |format|
      format.html { @athletes = Athlete.paginate(page: params[:page]) }
      format.csv { render text: Athlete.to_csv }      
    end
  end

  def update
    if @athlete.update(athlete_params)
      flash[:success] = "Athlete update successfully"
      redirect_to :back
    else
      flash[:alert] = "Errors are present"
      render 'edit'
    end
  end

  def destroy
    a = @athlete.destroy
    flash[:notice] = "#{a.full_name} has been deleted"
    redirect_to athletes_path
  end

  def upload
    if Athlete.import(params[:file])
      flash[:success] = "New athletes imported."
      redirect_to athletes_path
    else
      flash[:alert] = "Invalid file chosen"
      render 'import'
    end
  end

  private

  def athlete_params
    params.require(:athlete).permit(:first_name, :last_name, :dob, :club_id, :bib, :second_claim)
  end

  def find_athlete
    @athlete = Athlete.find(params[:id])
  end
end
