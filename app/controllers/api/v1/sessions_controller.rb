module Api
	module V1
		class SessionsController < ApplicationController
			skip_before_action :authenticate

			  def create
			    user = User.find_by(username: params[:username])
			    if user.authenticate(params[:password])
			      jwt = Auth.issue({id: user.id})
			      render json: {jwt: jwt}
			    else
			    end
			  end

			  private
			    def auth_params
			      params.require(:auth).permit(:username, :password)
			    end
		end
	end
end
