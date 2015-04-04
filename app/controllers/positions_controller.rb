class PositionsController < ApplicationController
	before_action :api_token_authorization
	def index
		if params[:nearby]
			
		else
			@positions = Position.all	
		end

		render :json => @positions
	end
	def show
		@position = Position.find(params[:id])
		render :json => @position
	end
end
