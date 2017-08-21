class AuditoriumsController < ApplicationController
	before_action :user_admin
	before_action :set_auditorium, only: [:show, :edit, :update, :destroy]
	before_action :now_playing, only: [:index]

	def index
		@auditoriums = Auditorium.all
	end

	def show
	end

	def new
		@auditorium = Auditorium.new
	end

	def edit
	end

	def create
		@auditorium = Auditorium.new(auditorium_params)

		respond_to do |format|
			if @auditorium.save
				format.html { redirect_to :controller => 'welcome', :action => 'admin', notice: 'Auditorium was successfully created.' }
				format.json { render :show, status: :created, location: @auditorium }
			else
				format.html { render :new }
				format.json { render json: @auditorium.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @auditorium.update(auditorium_params)
				format.html { redirect_to :controller => 'welcome', :action => 'admin', notice: 'Auditorium was successfully updated.' }
				format.json { render :show, status: :ok, location: @auditorium }
			else
				format.html { render :edit }
				format.json { render json: @auditorium.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@auditorium.destroy
		respond_to do |format|
			format.html { redirect_to :controller => 'welcome', :action => 'admin', notice: 'Auditorium was removed successfully.' }
			format.json { head :no_content }
		end
	end

	private

    def set_auditorium
      @auditorium = Auditorium.find(params[:id])
	end
	
	def auditorium_params
		params.require(:auditorium).permit(:name, :capacity)
	end

	def now_playing
		movies = Movie.where(now_playing: true)
		@movies = ["None"]
		movies.each do |movie|
			@movies << movie.title
		end
	end
end
