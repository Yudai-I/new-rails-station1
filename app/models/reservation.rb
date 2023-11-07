# 予約情報を表すモデル
# 予約は特定の上映スケジュール（Schedule）と座席（Sheet）に紐づいています。
# 予約は、名前とメールアドレスを持ち、これらは必須項目です。
# メールアドレスには特定のフォーマットが求められます。
# 同じ日、スケジュール、座席の組み合わせに重複した予約はできません。
class Reservation < ApplicationRecord
  # ScheduleモデルとSheetモデルへの所属関連
  belongs_to :schedule
  belongs_to :sheet

  # scheduleを通じてMovieモデルに委譲して、予約された映画情報を取得できるようにする
  delegate :movie, to: :schedule

  # 名前とメールアドレスの存在と長さの検証
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  # 予約日、スケジュールID、座席IDの組み合わせがユニークであることを検証
  validates :date, presence: true
  validates :schedule_id, presence: true
  validates :sheet_id, presence: true
  validates_uniqueness_of :sheet_id, scope: %i[schedule_id date],
                                     message: '指定された日時とスケジュールで既に予約が存在します。'
end
