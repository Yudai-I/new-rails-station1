class Reservation < ApplicationRecord
    belongs_to :schedule
    belongs_to :sheet
    # belongs_to :movie
    delegate :movie, to: :schedules

    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
