module Api
  module V1
    class ActivitiesController < ApplicationController

      def index
        render json: Activity.all
      end

      def show
        render json: Student.find(params[:id])
      end

      def new
      end

      def create
      end

      def edit
      end

      def update
      end

      def destroy
      end

      private

      def activity_params
          params.require(:activity).permit(:name)
      end
    end
  end
end
