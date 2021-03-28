class RecordsController < ApplicationController
	before_action :authenticate_employee!, except: []
	before_action :find_apt, only: [:show, :approved, :destroy]
	def index
	end

	def print_all
		@appointment=Appointment.all
	end

	def show
	end

	def approved
		@appointment.status= "approved"
		@appointment.save
		redirect_to employee_print_all_path
	end

	def destroy
		@appointment.destroy
		redirect_to employee_print_all_path
	end



	private
	def find_apt
		@appointment=Appointment.find(params[:id])
	end
end
