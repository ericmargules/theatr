class WelcomeController < ApplicationController
	before_action :user_admin, except: [:index]

	layout :resolve_layout

	def index
		@movies = Movie.where(now_playing: true)
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

	private

	def resolve_layout
	    case action_name
	    	when "index"
	    		"root"
			when "admin"
	        	"admin"
	    	else
	        	"theatr"
	    end
	end 
end
