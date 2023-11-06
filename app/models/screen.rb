class Screen < ApplicationRecord
  has_many :schedules, dependent: :destroy
end
