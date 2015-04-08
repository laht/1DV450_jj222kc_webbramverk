class PositionsController < ApplicationController
	before_action :api_token_authorization
	def index
		if params[:event_id]
			@positions = Event.find(params[:event_id]).position
		else
			@positions = Position.all	
		end
	rescue
		notFound
	end

	def show
		@position = Position.find(params[:id])
		@nearbyEvents = Position.find(params[:id]).nearbyEvents
	rescue
		notFound
	end
end
