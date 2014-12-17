require 'geokit'

class Parkingspot < ActiveRecord::Base
  scope :sunday_no_rules, -> { where("sunday IS NULL")}
  scope :monday_no_rules, -> {where("monday IS NULL")}
  scope :tuesday_no_rules, -> {where("tuesday IS NULL")}
  scope :wednesday_no_rules, -> {where("wednesday IS NULL")}
  scope :thursday_no_rules, -> {where("thursday IS NULL")}
  scope :friday_no_rules, -> {where("friday IS NULL")}
  scope :saturday_no_rules, -> {where("saturday IS NULL")}
  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude



  def self.closeby_no_rules(latitude, longitude, distance, day)
    day.downcase!
    case day
      when "sunday"
        spots_closeby = Parkingspot.sunday_no_rules.within(distance, :origin => [latitude, longitude]).all
      when "monday"
        spots_closeby = Parkingspot.monday_no_rules.within(distance, :origin => [latitude, longitude]).all
      when "tuesday"
        spots_closeby = Parkingspot.tuesday_no_rules.within(distance, :origin => [latitude, longitude]).all
      when "wednesday"
        spots_closeby = Parkingspot.wednesday_no_rules.within(distance, :origin => [latitude, longitude]).all
      when "thursday"
        spots_closeby = Parkingspot.thursday_no_rules.within(distance, :origin => [latitude, longitude]).all
      when "friday"
        spots_closeby = Parkingspot.friday_no_rules.within(distance, :origin => [latitude, longitude]).all
      when "saturday"
        spots_closeby = Parkingspot.saturday_no_rules.within(distance, :origin => [latitude, longitude]).all
    end
    return spots_closeby
  end


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
