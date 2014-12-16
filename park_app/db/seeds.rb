# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'CSV'

data = []


csv_data = File.read('db/parkinglocation.csv')

csv = CSV.parse(csv_data, :headers => true)

csv.each do |row|


	distance = row[3]
	distance.gsub)

x = {
		:boroughcode => row[0],
		:statusordernumber_id => row[1],
		:signsequence => row[2],
		:distance => distance,
		:arrowpoints => row[4],
		:signdescription => row[5]
	}

	\file.write(x.to_json)

end

Parkingspot.create(data)
