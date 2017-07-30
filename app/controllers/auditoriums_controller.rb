class AuditoriumsController < ApplicationController
	before_action :set_auditorium, only: [:show, :edit, :update, :destroy]
	
	def index
	end

	def show
	end

	def new
	end

	def edit
	end

	def create
	end

	def update
	end

	def destroy
	end

	private

    def set_auditorium
      @auditorium = Auditorium.find(params[:id])
	end
end
