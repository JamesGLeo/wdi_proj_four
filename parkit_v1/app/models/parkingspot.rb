require 'geokit'

class Parkingspot < ActiveRecord::Base
  scope :sunday_no_rules, {where("sunday LIKE NULL"}
  scope :monday_no_rules, {where("monday LIKE NULL"}
  scope :tuesday_no_rules, {where("tuesday LIKE NULL"}
  scope :wednesday_no_rules, {where("wednesday LIKE NULL"}
  scope :thursday_no_rules, {where("thursday LIKE NULL"}
  scope :friday_no_rules, {where("friday LIKE NULL"}
  scope :saturday_no_rules, {where("saturday LIKE NULL"}
  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude


  def self.close_to_me(latitude, longitude, distance, day)
    parking_spots = []
    spots_closeby = Parkingspot.within(distance, :origin => [latitude, longitude]).all
    spots_closeby.each do
      |spot|
      case spot[day]
      when nil
        spot = {
          :latitude => spot["latitude"],
          :longitude => spot["longitude"],
          :sign => spot["signdescription"]
        }
        parking_spots << spot
      end
    end
    return parking_spots
  end

  def self.close_to_me_no_rules(latitude, longitude, distance, day)
    spots_closeby = Parkingspot.within(distance, :origin => [latitude, longitude]).all
  end

  def can_i_park_here(range)

  end

  def generate_array(current_location, distance, day)
    self.close_to_me(current_location, distance)
    self.can_i_park_here(spots_closeby, day)
  end

end
