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
		set_price
		
		if @appointment.save
			redirect_to @appointment
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		set_price
		if @appointment.update(apt_params)	
			redirect_to @appointment
		else
			render 'edit'
		end
	end

	def destroy
		@appointment.destroy
		redirect_to '/all_apt'
	end

	def printall
		@appointment=Appointment.where("user_id=?",current_user.id)
	end

	def employee_option
	end

	private
	def find_apt
		@appointment=Appointment.find(params[:id])
	end

	def apt_params
		params.require(:appointment).permit(:service, :time, :vehicle_vin, :vehicle_name, :vehicle_manufacture, :vehicle_type, :vehicle_year, :vehicle_license_plate_num)
	end

	def set_price
		price=0.0
		case @appointment.service
		when "Full detail"
			if @appointment.vehicle_type=="car"
				price=80.0
			else
				price=85.0
			end
		when "Interior", "Exterior"
			if @appointment.vehicle_type=="car"
				price=45.0
			else
				price=50.0
			end
		when "Ceramic pro"
			if @appointment.vehicle_type=="car"
				price=1200.0
			else
				price=1300.0
			end
		when "Paint correction"
			if @appointment.vehicle_type=="car"
				price=250.0
			else
				price=300.0
			end
		end
		@appointment.price=price
	end
end
