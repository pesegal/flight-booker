class Flight < ActiveRecord::Base
	belongs_to :from_airport, :class_name => "Airport", foreign_key: "start_airport_id"
	belongs_to :to_airport, :class_name => "Airport",   foreign_key: "end_airport_id"

	has_many :bookings

	def self.get_dept_dates
		Flight.find_by_sql("SELECT DISTINCT departure FROM flights WHERE departure IS NOT null ORDER BY departure DESC")
	end



end
