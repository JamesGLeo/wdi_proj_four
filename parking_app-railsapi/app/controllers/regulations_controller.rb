class RegulationsController < ApplicationController
  def index
    regulations = Regulation.all
    render json: regulations
  end


  private

  def options
    defaults.merge(params)
  end

  def defaults
    {"day" => "", "time" => ""}
  end
end