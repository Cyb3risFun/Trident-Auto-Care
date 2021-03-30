class RecordsController < ApplicationController
	before_action :authenticate_employee!, except: []
	before_action :find_apt, only: [:show, :approved, :time_conflict, :destroy]
	def index
	end

	def print_all
		@appointment=Appointment.all
		@profit=Appointment.where(status:"approved").sum(:price)
	end

	def show
		@email=User.find(@appointment.user_id).email
	end

	def approved
		@appointment.status= "approved"
		@appointment.save
		redirect_to employee_print_all_path
	end
	
	def time_conflict
		@appointment.status= "Time Conflict"
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
