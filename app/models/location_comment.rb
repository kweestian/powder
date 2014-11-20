class LocationComment < ActiveRecord::Base
  belongs_to :location
  belongs_to :user

  validates :vote, 
  	numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
end
