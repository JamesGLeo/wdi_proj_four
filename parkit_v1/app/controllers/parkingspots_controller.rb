class ParkingspotsController < ApplicationController

  def index
    latitude = params[:latitude]
    longitude= params[:longitude]
    time = params[:time]
    day = params[:day]
    parkingspots = Parkingspot.closeby_with_rules(40.7400447,-73.9896498, 1, "WEDNESDAY", "7PM")
    render json: parkingspots
  end

end
