class AthletesController < ApplicationController
  before_action :find_athlete, only: [:show, :edit, :delete, :update, :destroy]

  def new
    @athlete = Athlete.new
  end

  def show
    @athlete = Athlete.includes(:club, results: [:fixture]).limit(10).find(params[:id])
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
      format.html { @athletes = Athlete.order('last_name ASC').paginate(page: params[:page]) }
      format.csv { render text: Athlete.to_csv }      
    end
  end

  def edit
    session[:return_to] ||= request.referer
  end

  def update
    if @athlete.update(athlete_params)
      flash[:success] = "Athlete update successfully"
      redirect_to session.delete(:return_to) || :back
    else
      flash[:alert] = "Errors are present"
      render 'edit'
    end
  end

  def delete
    session[:return_to] ||= request.referer
  end

  def destroy
    a = @athlete.destroy
    flash[:notice] = "#{a.full_name} has been deleted"
    redirect_to session.delete(:return_to)
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
