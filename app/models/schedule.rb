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
end
