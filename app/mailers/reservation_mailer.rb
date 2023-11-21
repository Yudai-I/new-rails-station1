class ReservationMailer < ApplicationMailer
    def notice_booked(user)
        mail(
         to: @user.email,
         subject: 'ようこそほげほげ'
        )
    end
end