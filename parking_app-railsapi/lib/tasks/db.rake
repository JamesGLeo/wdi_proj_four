namespace :db do
  desc "TODO"
  task seed_signs: :environment do
    require 'csv'

    # Open csv files
    REGULATIONS_TEXT = File.read('db/signs.csv')
    STREETSEGMENTS_TEXT = File.read('db/locations.csv')

    # Clear existing database
    Regulation.delete_all
    Location.delete_all


    # Create individual regulations
    regulations = []

    regulation_csv = CSV.parse(REGULATIONS_TEXT, headers: true)
    regulation_csv.each do |row|
      regulation = {
        :borough => row[0], # the sign's serial number
        :sign => row[1], # borough location of the sign
        :regulation_number => row[2], # order of the specific regulation on the sign
        :description => row[3], # regulation listed on the sign
        :direction => row[4], # direction of the regulation, denoted by an arrow on the sign
        :distance_regulated => row[5] # distance the specific regulation affects
      }
      regulations << regulation
    end

    Regulation.create(regulations)


    # Create individual signs
    locations = []

    location_csv = CSV.parse(STREETSEGMENTS_TEXT, headers: true)
    location_csv.each do |row|
      location = {
        borough: row[0],  # the sign's serial number
        sign: row[1],  # borough location of the sign
        mainstreet: row[2],  # primary street affected by the sign
        startstreet: row[3],  # where the sign's regulation begins
        endstreet: row[4],  # where the sign's regulation ends
        streetside: row[5]   # side of the street the sign is placed
      }
      locations << location
    end

    Location.create(locations)


    # JSON DIRECT FROM NYC OPEN DATA

    #
    # REGULATIONS_API_URL = "https://data.cityofnewyork.us/resource/zibd-yb3i.json"
    # STREETSEGMENTS_API_URL = "https://data.cityofnewyork.us/resource/9yzr-h7jq.json"
    #
    # Regulation.delete_all
    # Location.delete_all
    #
    # raw_regulations_data = HTTParty.get(REGULATIONS_API_URL)
    #
    # raw_regulations_data.each do |h|
    #   Regulation.create({
    #                       sign: h['statusordernumber'],  # the sign's serial number
    #                       borough: h['boroughcode'],  # borough location of the sign
    #                       regulation_number: h['signsequence'],  # order of the specific regulation on the sign
    #                       description: h['signdescription'],  # regulation listed on the sign
    #                       direction: h['arrowpoints'],  # direction of the regulation, denoted by an arrow on the sign
    #                       distance_regulated: h['distance']   # distance the specific regulation affects
    #                     })
    # end
    #
    # raw_segments_data = HTTParty.get(STREETSEGMENTS_API_URL)
    #
    # raw_segments_data.each do |h|
    #   Location.create({
    #                     sign: h['statusordernumber'],  # the sign's serial number
    #                     borough: h['boroughcode'],  # borough location of the sign
    #                     mainstreet: h['sideofstreet'],  # primary street affected by the sign
    #                     startstreet: h['fromstreet'],  # where the sign's regulation begins
    #                     endstreet: h['tostreet'],  # where the sign's regulation ends
    #                     streetside: h['mainstreet']   # side of the street the sign is placed
    #                   })
    # end

  end
end

