class ResultsController < ApplicationController
  def edit
  end

  def new
    @result = Result.new
  end

  def create
    @result = Result.new(result_params)
    if @result.save
      flash[:success] = "Result created"
      redirect_to race_path(@result.race.id)
    else
      flash[:alert] = "Errors were present"
      render 'new'
    end
  end

  def upload
    if Result.import(params[:file], params[:results][:race_id] )
      flash[:success] = "Results imported"
      redirect_to race_path(params[:results][:race_id])
    else
      flash[:alert] = "Invalid file chosen"
      render 'import'
    end
  end

  private

  def result_params
    params.require(:result).permit(:race_id, :position, :str_time, :bib )
  end
end
