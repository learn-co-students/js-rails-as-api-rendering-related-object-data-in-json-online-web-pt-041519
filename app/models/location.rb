class Location < ApplicationRecord
    has_many :signtings
    has_many :birds, through: :sightings
end
