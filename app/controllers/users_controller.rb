class UsersController < ApplicationController
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

end
