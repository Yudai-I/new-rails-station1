# 映画館のスクリーン（上映室）を表すモデル。
# 各スクリーンは複数の上映スケジュール（Schedule）を持つことができます。
# スクリーンが削除されると、それに紐づく上映スケジュールも削除されます。
class Screen < ApplicationRecord
  # Scheduleモデルへの関連付けで、スクリーンが削除された際に関連するスケジュールも削除される
  has_many :schedules, dependent: :destroy
end
