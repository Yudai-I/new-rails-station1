# 映画の上映スケジュールを表すモデル。
# 各スケジュールは1つの映画（Movie）に紐づき、1つのスクリーン（Screen）で上映されます。
# また、スケジュールは複数の予約（Reservation）を持つことができ、
# スケジュールが削除された場合には、関連する予約も同時に削除されます。
class Schedule < ApplicationRecord
  # MovieモデルとScreenモデルへの所属関連
  belongs_to :movie
  belongs_to :screen
  belongs_to :theater

  # Reservationモデルへの関連付けで、スケジュールが削除された際に予約も削除される
  has_many :reservations, dependent: :destroy
  validate :unique_schedule_for_theater_and_screen

  private

  def unique_schedule_for_theater_and_screen
    overlapping_schedule = Schedule.where(theater_id: theater_id, screen_id: screen_id, schedule_date: schedule_date)
                                   .where("start_time < ? AND end_time > ?", end_time, start_time)
                                   .exists?

    errors.add(:base, "Schedule conflicts with an existing schedule") if overlapping_schedule
  end
end
