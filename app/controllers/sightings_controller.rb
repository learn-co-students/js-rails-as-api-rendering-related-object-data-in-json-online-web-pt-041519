class SightingsController < ApplicationController
    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location], except: [:updated_at]
      end
    
    def show
        sighting = Sighting.find_by(id: params[:id])
    if sighting
        render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }
    else
        render json: { message: 'No sighting found with that id' }

      end
end
