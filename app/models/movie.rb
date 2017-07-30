class Movie < ApplicationRecord
	has_many :showtimes
	has_many :orders, through: :showtimes
end
