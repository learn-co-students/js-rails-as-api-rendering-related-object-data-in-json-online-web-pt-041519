class Location < ApplicationRecord
  has_many :sightings
  has_many :bird, through: :sightings
end
