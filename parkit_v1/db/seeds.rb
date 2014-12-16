# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'CSV'

data = []


csv_data = File.read('db/parkingtest.csv')

csv = CSV.parse(csv_data, :headers => true)

csv.each do |record|
  @parser = ScheduleParser.new
  string_to_parse = record[5]
  rule_hash = @parser.call(string_to_parse)
  primary_hash = {
    boroughcode: record[0],
    statusordernumber: (record[1].strip),
    signsequence: record[2],
    distance: record[3],
    arrowpoints: record[4],
    signdescription: record[5]
  }

  primary_hash.merge!(rule_hash)

  data << primary_hash
end

Parkingspot.create(data)
