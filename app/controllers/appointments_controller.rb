class AppointmentsController < ApplicationController
	before_action :find_apt, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@appointments=Appointment.all.order("created_at DESC")
	end

	def show
	end

	def new
		@appointment=current_user.appointments.build
	end

	def create
		@appointment=current_user.appointments.build(apt_params)
		if @appointment.save
			redirect_to @appointment
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @appointment.update(apt_params)
			redirect_to @appointment
		else
			render 'edit'
		end
	end

	def destroy
		@appointment.destroy
		redirect_to root_path
	end

	private
	def find_apt
		@appointment=Appointment.find(params[:id])
	end

	def apt_params
		params.require(:appointment).permit(:service, :time, :vehicle_vin, :vehicle_name, :vehicle_manufacture, :vehicle_type, :vehicle_year, :vehicle_license_plate_num)
	end
end
