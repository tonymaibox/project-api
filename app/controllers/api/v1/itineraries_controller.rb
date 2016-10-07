module Api
	module V1
		class ItinerariesController < ApplicationController

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
		  	# binding.pry
		  	@activity_result = Activity.search(params[:activity])
		  	@location_result = Location.search(params[:location])
		  	@day_result = Day.search(params[:day])
		  	@list = []
		
		  	@activity_result.each {|activity| @list << activity.itineraries }
		  	@location_result.each {|location| @list << location.itineraries }
		  	@day_result.each {|day| @list << day.itinerary }

		  	binding.pry

		  	render json: @list.flatten.uniq, include: { days: {locations: [ :activities ] } }
		  end

		  def create
		
		    i = Itinerary.create(name: params[:itinerary][:name])
		    Day.creator([i.id, params[:itinerary][:days]])


		    # if i.save
		    #   render json: i
		    # else
		    #   render json: i.errors, status: 500
		    # end
		  end

		  private

		  # def itinerary_params
		  # 	params.require(:itinerary).permit(:name)
		  # end

		end
	end
end
