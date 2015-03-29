class EventsController < ApplicationController
	def index
		@events = Event.order('Created_at DESC')
		render :json => @events
	end
	def show
		@event = Event.find(params[:id])
		render :json => @event
	end
end
