# 顧客用の映画のスケジュール詳細コントローラ
class SchedulesController < ApplicationController
  def show
    @schedule = Schedule.find(params[:schedule_id])
  end
end
