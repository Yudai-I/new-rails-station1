class Admin::SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all
  end

  def show
  end

  def create
    schedule = Schedule.new(schedule_params)
    if schedule.save!
      redirect_to admin_schedules_path
    else
      flash.now[:error] = '値が空です'
      render :new
    end
  end

  def edit
  end

  def new
    @schedule = Schedule.new
    @schedule.movie_id = @movie
  end

  private
  def schedule_params
    params.require(:schedule).permit(:start_time, :end_time, :movie_id)
  end

end
