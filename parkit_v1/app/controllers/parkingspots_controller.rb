class ParkingspotsController < ApplicationController

  def api1
    latitude = params[:latitude]
    longitude = params[:longitude]
    day = params[:day]
    parkingspots = Parkingspot.closeby_no_rules(latitude,longitude, 1, day)
    render json: parkingspots
  end

  def api2
    latitude = params[:latitude]
    longitude = params[:longitude]
    day = params[:day]
    time = params[:time]
    parkingspots = Parkingspot.closeby_with_rules(latitude,longitude, 1, day, time)
    render json: parkingspots
  end

end
