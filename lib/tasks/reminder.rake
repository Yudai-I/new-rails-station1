namespace :reminder do
    desc "予約日前日の予約者全員にリマインダーをする"
    task send_reminders: :environment do
        reservations = Reservation.joins(:schedule).where(schedules: { schedule_date: Date.tomorrow })

        reservations.each do |reservation|
            ReservationMailer.reminder_email(reservation).deliver_now
        end
    end
end
