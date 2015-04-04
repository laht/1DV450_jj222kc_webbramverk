class EventsController < ApplicationController
	before_action :api_token_authorization
	def index
		if params[:tag_id]
			@events = Tag.find(params[:tag_id]).events
		elsif params[:creator_id]
			@events = Creator.find(params[:creator_id]).events
		else
			@events = Event.order('Created_at DESC')
		end
		render :json => @events
	end
	def show
		@event = Event.find(params[:id])
		render :json => @event
	end
end
