require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection(
		adapter: "postgresql",
		database: "park_app_development"
		)



class Parkingspot < ActiveRecord::Base

	regulations = Parkingspot.all
	reg_array = regulations.map { |regulation| regulation.signdescription }

	def park_here
		case x = Parkingspot.signdescription
		when  x.include?("NO PARKING ANYTIME")
				puts Parkingspot.boroughcode
		else
		end
	end


	binding.pry




end
