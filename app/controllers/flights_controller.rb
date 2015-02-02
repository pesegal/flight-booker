class FlightsController < ApplicationController
	def index
		@flights = Flight.all
		@search = false
		search_form_init

	end

	def search
		@flights = Flight.where(start_airport_id: params[:departure_id], end_airport_id: params[:arrival_id], departure: params[:dept_date])
		@pass_num = params[:pass_num]
		@search = true
		search_form_init
		render "index"

	end

	private
	  def search_form_init
	  	@flight_dep_opt = Airport.all.map { |f| [f.code, f.id] }
		@flight_arr_opt = Airport.all.map { |f| [f.code, f.id] }
		@flight_pas_opt = [1, 2, 3, 4]
		@flight_dep_date = Flight.get_dept_dates.map { |f| [f.departure] }
	  end
end
