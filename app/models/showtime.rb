class Showtime < ApplicationRecord
	attr_accessor :begin, :end, :allday
	belongs_to :movie, dependent: :destroy
	belongs_to :auditorium, dependent: :destroy
	has_many :orders
end
