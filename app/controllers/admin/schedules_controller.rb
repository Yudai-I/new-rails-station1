module Admin
  class SchedulesController < ApplicationController
    def index
      @schedules = Schedule.all
    end

    def show
      @schedule = Schedule.find(params[:id])
      @movies = Movie.all
    end

    def create
      @schedule = Schedule.new(schedule_params)
      @movie = Movie.find(params[:movie_id])
      @schedule.movie_id = @movie.id
      if @schedule.save
        redirect_to admin_schedules_path
      else
        flash[:notice] = 'スケジュールが被っています'
        redirect_to admin_schedules_path
      end
    rescue ActiveRecord::RecordNotUnique
      flash[:notice] = '無効なスケジュールです'
      redirect_to admin_schedules_path
    end

    def edit
    end

    def new
      @schedule = Schedule.new
      @movie = Movie.find(params[:movie_id])
    end

    def update
      schedule = Schedule.find(params[:id])
      if schedule.update(schedule_params)
        flash[:notice] = "スケジュール更新に成功しました"
        redirect_to admin_schedules_path
      else
        @schedule = Schedule.find(params[:id])
        render :show
        flash.now[:error] = "スケジュール更新に失敗しました"
      end 
    end

    def destroy
      schedule = Schedule.find(params[:id])
      if schedule.destroy
        flash[:notice] = '削除に成功しました'
        redirect_to admin_schedules_path
      else
        flash[:notice] = '削除に失敗しました'
        @schedules = Schedule.all
        render :index
      end
    end

    private

    def schedule_params
      params.require(:schedule).permit(:schedule_date, :start_time, :end_time, :movie_id, :screen_id, :theater_id)
    end
  end
end
