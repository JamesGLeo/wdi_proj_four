require 'geokit'

class Parkingspot < ActiveRecord::Base
  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude


  def close_to_me(current_location, distance)
    spots_closeby = Parkingspot..within(distance, :origin =>current_location).all
    count = Parkingspot..within(distance, :origin =>current_location).count
  end


  def can_i_park_here(spots_closeby, day)
    spots_closeby.each

  end


end
