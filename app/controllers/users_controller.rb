class UsersController < ApplicationController
  def show
    @reservations = Reservation.where(email: current_user.email)
  end
end
