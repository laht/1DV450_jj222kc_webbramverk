class EventsController < ApplicationController
	before_action :api_token_authorization
	def index
		if params[:tag_id]
			@events = Tag.find(params[:tag_id]).events
		elsif params[:creator_id]
			@events = Creator.find(params[:creator_id]).events
		elsif params[:position_id]
			@events = Position.find(params[:position_id]).events
		else
			@events = Event.order('Created_at DESC')
		end
	rescue
		notFound
	end
	def show
		@event = Event.find(params[:id])
	rescue
		notFound
	end
end
