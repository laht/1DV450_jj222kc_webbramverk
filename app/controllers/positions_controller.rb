class PositionsController < ApplicationController
	before_action :api_token_authorization
	before_filter :verify_users_creds, :only => [:create, :update, :destroy]
	def index
		if params[:event_id]
			@positions = Event.find(params[:event_id]).position
		else
			@positions = Position.all	
		end
	rescue
		notFound
	end

	def create		
		@position = Position.new(position_params)

		if ((@position.longitude == 0 || @position.longitude == nil) || (@position.latitude == 0 || @position.latitude == nil)) 
			bad_request
		elsif @position.save
	 		render :template => '/positions/show', :status => :created
	 	else
	 		bad_request
		end
	rescue
		bad_request	
	end

	def destroy
		@position = Position.find(params[:id])

		if @position.nil?
			notFound
		else
			@position.destroy
			render :template => '/positions/destroy', :status => :ok
		end
	end

	def update
		@position = Position.find(params[:id])

		if @position.nil?
			notFound
		elsif @position.update_attributes(position_params)
			render :template => '/positions/show', :status => :ok
		else
			not_modified
		end
	end

	def show
		@position = Position.find(params[:id])
		@nearbyEvents = Position.find(params[:id]).nearbyEvents
	rescue
		notFound
	end

	private 
	def position_params
		params.permit(:name, :longitude, :latitude)
	end
end
