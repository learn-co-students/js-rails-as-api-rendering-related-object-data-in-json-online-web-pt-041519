class SightingsController < ApplicationController

    def index
        sightings = Sighting.all 
        render json: sightings, include: [:bird, :location]
    end


    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting 
            # render json: sighting.to_json(include: [:bird, :location],  except:  [:updated_at,  :created_at])
            # render json: sighting, include: [:bird, :location], except: [:updated_at]
            render json: sighting.to_json(:include => {
                :bird => {:only => [:name, :species]},
                :location => {:only => [:latitude, :longitude]}
                }, :only => [:id]
            )
        else
            render  json: { message: 'No sighting found'}
        end
    end

end
