class SchedulesController < ApplicationController
  def index
  end

  def show
  end

  def create
  end

  def edit
  end

  private
  def schedule_params
    params.require(:schedule).permit(:start_time, :end_time)
  end
end
