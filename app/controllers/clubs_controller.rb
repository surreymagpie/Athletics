class ClubsController < ApplicationController
  before_action :find_club, only: [:show, :edit, :update, :delete, :destroy]

  def index
    @div1 = Club.division_one.alphabetical
    @div2 = Club.division_two.alphabetical
  end

  def show
  end

  def edit
  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    if @club.save
      flash[:success] = "Club created successfully"
      redirect_to clubs_path
    else
      flash[:error] = "Errors are present"
      render 'new'
    end
  end

  def update
    if @club.update(club_params)
      flash[:success] = "Club updated successfully"
      redirect_to clubs_path
    else
      flash[:error] = "Errors are present"
      render 'edit'
    end
  end

  def delete
  end

  def destroy
    club = @club.destroy
    flash[:notice] = "#{club.name} has been deleted"
    redirect_to clubs_path
  end

  private

  def club_params
    params.require(:club).permit(:name, :abbr, :contact, :email, :url, :division)
  end

  def find_club
    @club = Club.find(params[:id])
  end
end
