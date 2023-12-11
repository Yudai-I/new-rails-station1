class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:show, :destroy]
  
  def show
    @reservations = Reservation.where(email: current_user.email)
  end

  def destroy
    reservation = Reservation.find(params[:id])
    if reservation.destroy
      flash[:notice] = "予約の取り消しに成功しました"
      redirect_to user_path(current_user.id)
    else
      @reservations = Reservation.where(email: current_user.email)
      render :show
    end
  end

  private

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to movies_path
    end
  end

end
