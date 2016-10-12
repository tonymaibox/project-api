module Api
	module V1
		class ItinerariesController < ApplicationController

		skip_before_action :authenticate, only: [:index, :show, :search]

			def index
				# render json: Itinerary.all, include: { days: {locations: [ :activities ] } }
				if params[:search]
					render json: Itinerary.search(params[:search]).order("id DESC"), include: { days: {locations: [ :activities ] } }
				else
					render json: Itinerary.all, include: {users: [{}], days: {locations: [ :activities ] } }
				end
			end

		  def show
		    render json: Itinerary.find(params[:id])
		  end

		  def search
        if params[:activity] == ""
          @activity_result = []
        else
		  	  @activity_result = Activity.search(params[:activity])
        end
        if params[:location] == ""
          @location_result = []
        else
  		  	@location_result = Location.search(params[:location])
        end
        if params[:day] == ""
          @day_result = []
        else
          @day_result = Day.search(params[:day])
        end
		  	@list = []

		  	@activity_result.each {|activity| @list << activity.itineraries }
		  	@location_result.each {|location| @list << location.itineraries }
		  	@day_result.each {|day| @list << day.itinerary }

		  	render json: @list.flatten.uniq, include: { days: {locations: [ :activities ] } }
		  end

		  def create
		    i = Itinerary.create(name: params[:itinerary][:name])
		    Day.creator([i.id, params[:itinerary][:days]])
		  end

		  def update
		  	binding.pry
		  	i = Itinerary.find(params[:itinerary][:id])
		    Day.updater([i.id, params[:itinerary][:days]])
		    binding.pry
		  end

		  private

		  # def itinerary_params
		  # 	params.require(:itinerary).permit(:name)
		  # end
		end
	end
end
