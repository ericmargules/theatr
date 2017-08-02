class WelcomeController < ApplicationController
	before_action :user_admin, except: [:index]

	def index
		@days = []
		day = Date.today
		7.times do
			movies = {}
			showtimes = Showtime.where(date: day.to_s )
			showtimes.each do |showtime|
				if !movies[showtime.movie.title]
					movies[showtime.movie.title] = []
				end
				movies[showtime.movie.title] << [showtime.time, (showtime.auditorium.capacity - Order.where(showtime: showtime).count)]
			end
			@days << movies
			day += 1
		end
	end

	def admin
		@auditoriums = Auditorium.all
		@movies = Movie.all
		@showtimes = Showtime.all
		@orders = Order.all
	end
end
