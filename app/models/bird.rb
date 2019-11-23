class Bird < ApplicationRecord
    has_many :sightings
    has_many :locaitons, through: :sightings
end