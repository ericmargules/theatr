class MoviesController < ApplicationController
	before_action :user_admin, except: [:show]
	before_action :set_movie, only: [:show, :edit, :update, :destroy]
	
	layout :resolve_layout

	def index
		@movies = Movie.all
	end

	def show
		@days = []
		day = Date.today
		7.times do
			day_array = []
			showtimes = @movie.showtimes.where(date: day.to_s )
			showtimes.each do |showtime|
				day_array << [showtime.time, (showtime.auditorium.capacity - Order.where(showtime: showtime).count)]
			end
			@days << day_array
			day += 1
		end
	end

	def new
		@movie = Movie.new
	end

	def edit
	end

	def create
		@movie = Movie.new(movie_params)

		respond_to do |format|
			if @movie.save
				format.html { redirect_to :controller => 'welcome', :action => 'admin', notice: 'Movie was successfully created.' }
				format.json { render :show, status: :created, location: @movie }
			else
				format.html { render :new }
				format.json { render json: @movie.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @movie.update(movie_params)
				format.html { redirect_to :controller => 'welcome', :action => 'admin', notice: 'Movie was successfully updated.' }
				format.json { render :show, status: :ok, location: @movie }
			else
				format.html { render :edit }
				format.json { render json: @movie.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		Showtime.where(movie: @movie).each do |showtime|
			showtime.destroy
		end
		@movie.destroy
		respond_to do |format|
			format.html { redirect_to :controller => 'welcome', :action => 'admin', notice: 'Movie was removed successfully.' }
			format.json { head :no_content }
		end
	end

	private

	def set_movie
		@movie = Movie.find(params[:id])
	end

	def movie_params
		params.require(:movie).permit(:title, :description, :poster, :cover, :rating, :length, :now_playing)
	end

	def resolve_layout
	    case action_name
	      when "show"
	        "movie"
	      else
	        "theatr"
	    end
	end 
end
