class WelcomeController < ApplicationController
	def index
		@showtimes = Showtime.all
	end
end
