class RecordsController < ApplicationController
	before_action :authenticate_employee!, except: []
	before_action :find_apt, only: [:show, :approved, :time_conflict, :destroy]

	def index
	end

	def print_all
		@appointment=Appointment.all
		@profit=Appointment.where(status:"approved").sum(:price)
		restrict_string
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

	def restrict_day
		if $restrict.include?(params[:day])
			$restrict.delete(params[:day])
		else
			$restrict.append(params[:day])
		end
		$restrict.sort
		restrict_string
		redirect_to employee_print_all_path
	end

	def reset_restrict
		$restrict=[]
		$restrict_day=["None"]
		redirect_to employee_print_all_path
	end



	private
	def find_apt
		@appointment=Appointment.find(params[:id])
	end

	def restrict_string
		$restrict_day=[]
		if $restrict.include?("1")
			$restrict_day.append("Monday")
		end
		if $restrict.include?("2")
			$restrict_day.append("Tuesday")
		end
		if $restrict.include?("3")
			$restrict_day.append("Wednesday")
		end
		if $restrict.include?("4")
			$restrict_day.append("Thursday")
		end
		if $restrict.include?("5")
			$restrict_day.append("Friday")
		end
		if $restrict.include?("6")
			$restrict_day.append("Saturday")
		end
		if $restrict.include?("7")
			$restrict_day.append("Sunday")
		end
	end
end
