class AppointmentsController < ApplicationController
	def index
	end

	def show
	end

	def new
		@appointment=Appointment.new
	end

	def create
		@appointment=Appointment.new(apt_params)
		if @appointment.save
			redirect_to @appointment
		else
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def cancel
	end

	private
	def find_apt
	end

	def apt_params
		params.require(:appointment).permit(:service, :time)
	end
end
