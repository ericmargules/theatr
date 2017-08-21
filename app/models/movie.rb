class Movie < ApplicationRecord
	has_many :showtimes, dependent: :destroy
	has_many :orders, through: :showtimes
end
