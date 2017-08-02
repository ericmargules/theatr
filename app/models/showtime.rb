class Showtime < ApplicationRecord
	attr_accessor :begin, :end, :allday
	belongs_to :movie
	belongs_to :auditorium
	has_many :orders
end
