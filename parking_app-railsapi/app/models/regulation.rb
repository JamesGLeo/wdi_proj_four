class Regulation < ActiveRecord::Base
  belongs_to :location, :foreign_key => :sign

  scope :day_parking_restricted, -> (day){ where("lower(description)LIKE ?", "%#{day.downcase}")}
  scope :time_parking_restricted, -> (time){ where("lower(description)LIKE ?", "%#{time.downcase}")}

  def as_json(options = nil)
    super(options.merge(except: [:created_at, :updated_at, :regulation_number]))
  end
end
