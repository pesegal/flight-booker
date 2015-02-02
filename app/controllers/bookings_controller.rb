class BookingsController < ApplicationController
	def new
		@flight = Flight.find(params[:flight_select])
		@booking = @flight.bookings.new
		@pass_num = params[:pass_num].to_i
		@pass_num.times { @booking.passengers.build }
	end

	def create
		@flight = Flight.find(params[:flight_select])
		@booking = @flight.bookings.create(booking_params)

		redirect_to @booking

	end

	def show
		@booking = Booking.find_by(id: params[:id])
	end

	private

	 def booking_params
	 	params.require(:booking).permit(:flight_select, passengers_attributes:  [:name, :email])
	 end
end
