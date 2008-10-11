class Location < ActiveRecord::Base
  validates_presence_of     :line1, :city, :region, :zipcode, :country
  validates_length_of       :line1, :city, :region, :country, :within => 4..40
end
