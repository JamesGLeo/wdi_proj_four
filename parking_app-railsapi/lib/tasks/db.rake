namespace :db do
  desc "TODO"
  task seed_signs: :environment do
    REGULATIONS_API_URL = "https://data.cityofnewyork.us/resource/zibd-yb3i.json"
    STREETSEGMENTS_API_URL = "https://data.cityofnewyork.us/resource/9yzr-h7jq.json"

    Regulation.delete_all
    Location.delete_all

    raw_regulations_data = HTTParty.get(REGULATIONS_API_URL)

    raw_regulations_data.each do |h|
      Regulation.create({
                          sign: h['statusordernumber'],  # the sign's serial number
                          borough: h['boroughcode'],  # borough location of the sign
                          regulation_number: h['signsequence'],  # order of the specific regulation on the sign
                          description: h['signdescription'],  # regulation listed on the sign
                          direction: h['arrowpoints'],  # direction of the regulation, denoted by an arrow on the sign
                          distance_regulated: h['distance']   # distance the specific regulation affects
                        })
    end

    raw_segments_data = HTTParty.get(STREETSEGMENTS_API_URL)

    raw_segments_data.each do |h|
      Location.create({
                        sign: h['statusordernumber'],  # the sign's serial number
                        borough: h['boroughcode'],  # borough location of the sign
                        mainstreet: h['sideofstreet'],  # primary street affected by the sign
                        startstreet: h['fromstreet'],  # where the sign's regulation begins
                        endstreet: h['tostreet'],  # where the sign's regulation ends
                        streetside: h['mainstreet']   # side of the street the sign is placed
                      })
    end

  end
end