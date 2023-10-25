class SchedulesController < ApplicationController

  def show
    @schedule = Schedule.find(params[:schedule_id])
  end

end