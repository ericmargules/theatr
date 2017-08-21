class ShowtimesController < ApplicationController
	before_action :user_admin
	before_action :set_showtime, only: [:show, :edit, :update, :destroy]
	
	def index
		@showtimes = Showtime.all
	end

	def show
	end

	def new
		@showtime = Showtime.new
		@auditorium = Auditorium.find(params[:auditorium]) if params[:auditorium]	
		@movie = Movie.find(params[:movie]) if params[:movie]
	end

	def edit
	end

	def create
		@showtime = Showtime.new(showtime_params)
		begin_and_end
		redirect_to :controller => 'welcome', :action => 'admin'
	end

	def update
		respond_to do |format|
			if @showtime.update(showtime_params)
				format.html { redirect_to :controller => 'welcome', :action => 'admin', notice: 'Showtime was successfully updated.' }
				format.json { render :show, status: :ok, location: @showtime }
			else
				format.html { render :edit }
				format.json { render json: @showtime.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@showtime.destroy
		respond_to do |format|
			format.html { redirect_to :controller => 'welcome', :action => 'admin', notice: 'Showtime was removed successfully.' }
			format.json { head :no_content }
		end
	end

	private

    def set_showtime
      @showtime = Showtime.find(params[:id])
	end

	def showtime_params
		params.require(:showtime).permit(:movie_id, :auditorium_id, :date, :time, :begin, :end, :allday)
	end

	def begin_and_end
		(((parse_date(@showtime.end) - parse_date(@showtime.begin)).to_i) + 1).times do |int|
			parse_allday(int)
		end
	end

	def parse_date(hash)
		(Date.parse(hash.to_a.sort.collect{|c| c[1]}.join("-")))
	end

	def parse_allday(int)
		if @showtime.allday != "0"
			time = Time.new(parse_date(@showtime.begin).year, parse_date(@showtime.begin).month, parse_date(@showtime.begin).day, "+12:00")
			closing = Time.new(parse_date(@showtime.begin).year, parse_date(@showtime.begin).month, parse_date(@showtime.begin).day, "+23:00")
			movie_length = @showtime.movie.length + 30
			until (time + movie_length.minutes) > closing
				@showtimes = Showtime.new(showtime_params)
				Time.current.dst? ? @showtimes.time = time.utc + 1.hour : @showtimes.time = time.utc
				@showtimes.date = (parse_date(@showtime.begin) + int.days)
				time = time + movie_length.minutes
				@showtimes.save
			end
		else
			@showtimes = Showtime.new(showtime_params)
			@showtimes.date = (parse_date(@showtime.begin) + int.days)
			Time.current.dst? ? @showtimes.time = @showtime.time.utc + 1.hour : @showtimes.time = @showtime.time.utc
			@showtimes.save
		end
	end
end
