class ReservationMailer < ApplicationMailer
    def reservation_confirmation(user, reservation)
        @user = user
        @reservation = reservation
        mail(to: @user.email, subject: '予約完了のお知らせ')
    end

    def reminder_email(reservation)
        @email = reservation.email
        @reservation = reservation
        mail(to: @email, subject: '予約日前日のお知らせ')
    end
end