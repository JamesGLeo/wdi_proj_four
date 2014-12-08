class Location < ActiveRecord::Base
  has_many :regulations, :foreign_key => :sign

  # delegate :regulation_number, :description, :direction, :distance_regulated, to: :regulation

end

