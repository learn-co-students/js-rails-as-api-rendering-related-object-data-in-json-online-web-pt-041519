class SightingsController < ApplicationController
    def index
        sighting = Sighting.all 
        render json: sighting, include: [:bird, :location]
    end
    
    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            render json: sighting, include: [:bird, :location]
        else
            render json: {message: 'No sighting was found with that id.'}
        end
    end
end
