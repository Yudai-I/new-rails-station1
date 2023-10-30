class Admin::SchedulesController < ApplicationController
 
  def index
    @schedules = Schedule.all
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @movie = Movie.find(params[:movie_id])
    @schedule.movie_id = @movie.id
    if @schedule.save
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
    @movie = Movie.find(params[:movie_id])
  end

  def update
    schedule = Schedule.find(params[:id])
    schedule.update(schedule_params)
    redirect_to admin_schedules_path(schedule.id)
  end
  
  def destroy
    schedule = Schedule.find(params[:id])
    if schedule.destroy
      flash[:notice] = "削除に成功しました"
      redirect_to admin_schedules_path
    else
      flash[:notice] = "削除に失敗しました"
      @schedules = Schedule.all
      render :index
    end
  end

  private
  def schedule_params
    params.require(:schedule).permit(:schedule_date, :start_time, :end_time, :movie_id)
  end

end
