# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ap_codes = %w( SFO NYC LAX PDX ORD )

ap_codes.each do |code|
	Airport.create({ code: "#{code}"})
end

#generate flights

20.times do |x|
	dep_ap = Random.rand(5) + 1
	arr_ap = nil
	while arr_ap == nil
		arr_ap = Random.rand(5) + 1
		arr_ap = nil if arr_ap == dep_ap
	end
	Flight.create({start_airport_id: dep_ap, end_airport_id: arr_ap, departure: Time.now, duration: (Random.rand(300) + 1)})
end