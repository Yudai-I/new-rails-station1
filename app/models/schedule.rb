class Schedule < ApplicationRecord
    belongs_to :movie
    belongs_to :screen
    has_many :reservations, dependent: :destroy
end
