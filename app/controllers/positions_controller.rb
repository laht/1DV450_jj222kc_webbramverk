class PositionsController < ApplicationController
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
