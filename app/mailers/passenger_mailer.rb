class PassengerMailer < ApplicationMailer
	default from: 'notifications@example.com'

	def thank_you_email(pass)
		@passenger = pass		
	    mail(to: @passenger.email, subject: "Your flight has been booked.")

	end

end
