class Sheet < ApplicationRecord
  has_many :reservations, dependent: :destroy
end
