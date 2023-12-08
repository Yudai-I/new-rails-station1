# 映画情報を表すモデル
# 各映画はユニークな名前を持ち、複数の上映スケジュール（Schedule）と関連付けられています。
# 映画が削除されると、それに関連するスケジュールも同時に削除されます。
# また、スケジュールを通じて予約情報（Reservation）とも関連しています。
class Movie < ApplicationRecord
  # 名前のユニーク性を検証
  validates :name, uniqueness: true

  # 映画に関連する上映スケジュール（Scheduleモデル）との1対多の関連
  # 映画が削除されたときに関連するスケジュールも削除する
  has_many :schedules, dependent: :destroy

  # 上映スケジュールを介して予約（Reservationモデル）との間に多対多の関連を持つ
  has_many :reservations, through: :schedules

  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
end
