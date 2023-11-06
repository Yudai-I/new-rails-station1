class Movie < ApplicationRecord
  validates :name, uniqueness: true
  has_many :schedules, dependent: :destroy
  has_many :reservations, through: :schedules
end
