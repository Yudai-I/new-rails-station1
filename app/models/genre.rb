class Genre < ApplicationRecord
    has_many :movies, dependent: :destory
end
