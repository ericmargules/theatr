class ShowtimesController < ApplicationController
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

		respond_to do |format|
			if @showtime.save
				format.html { redirect_to @showtime, notice: 'Showtime was successfully created.' }
				format.json { render :show, status: :created, location: @showtime }
			else
				format.html { render :new }
				format.json { render json: @showtime.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @showtime.update(showtime_params)
				format.html { redirect_to @showtime, notice: 'Showtime was successfully updated.' }
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
			format.html { redirect_to showtimes_url, notice: 'Showtime was removed successfully.' }
			format.json { head :no_content }
		end
	end

	private

    def set_showtime
      @showtime = Showtime.find(params[:id])
	end

	def showtime_params
		params.require(:showtime).permit(:movie_id, :auditorium_id, :date, :time)
	end
end
