module Api
	module V1
		class ItinerariesController < ApplicationController

			def index
				render json: Itinerary.all, include: { days: {locations: [ :activities ] } }
			end

		  def show
		    render json: Itinerary.find(params[:id])
		  end

		  def create
		    i = Itinerary.new(itinerary_params)
		    if i.save
		      render json: i
		    else
		      render json: i.errors, status: 500
		    end
		  end

		  private

		  def itinerary_params
		  	params.require(:itinerary).permit(:name)
		  end

		end
	end
end