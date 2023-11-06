class Reservation < ApplicationRecord
  belongs_to :schedule
  belongs_to :sheet
  delegate :movie, to: :schedule

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  # date, schedule_id, および sheet_id の組み合わせがユニークであることを検証
  validates :date, presence: true
  validates :schedule_id, presence: true
  validates :sheet_id, presence: true
  validates_uniqueness_of :sheet_id, scope: %i[schedule_id date], message: '指定された日時とスケジュールで既に予約が存在します。'
end
