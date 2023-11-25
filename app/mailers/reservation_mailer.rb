class ReservationMailer < ApplicationMailer
    def reservation_confirmation(user, reservation)
        @user = user
        @reservation = reservation
        mail(
         to: @user.email,
         subject: 'ようこそほげほげ'
        )
    end
end