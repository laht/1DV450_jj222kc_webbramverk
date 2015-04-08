class CreatorsController < ApplicationController
	before_action :api_token_authorization
	def index
		if params[:event_id]
			@creators = Event.find(params[:event_id]).creator
		else
			@creators = Creator.all
		end
	rescue
		notFound
	end
	def show
		@creator = Creator.find(params[:id])
	rescue
		notFound
	end
end