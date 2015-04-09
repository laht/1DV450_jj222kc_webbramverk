class EventsController < ApplicationController
	before_action :api_token_authorization
	before_filter :verify_users_creds, :only => [:create, :update, :destroy]

	def index
		if params[:tag_id]
			@events = Tag.find(params[:tag_id]).events
		elsif params[:creator_id]
			@events = Creator.find(params[:creator_id]).events
		elsif params[:position_id]
			@events = Position.find(params[:position_id]).events
		elsif params[:search]
			@events = search_events(params[:search])
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

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		if params[:tag_id]
			@event.tags << Tag.find(params[:tag_id])
		end
		if params[:tag_name]
			tag_name = params[:tag_name]
			t = Tag.find_or_create_by(name: :tag_name)
			@event << t
		end	
		if @event.save
			render :template => '/events/show', :status => :created
		else
			bad_request
		end
	rescue
		bad_request
	end

	def update
		@event = Event.find(params[:id])

		if @event.nil?
			notFound
		elsif @event.update_attributes(event_params)
			render :template => '/events/show', :status => :ok
		else
			not_modified
		end
	end

	def destroy
		@event = Event.find(params[:id])

		if @event.nil?
			notFound
		else
			@event.destroy
			render :template => '/events/destroy', :status => :ok
		end
	end

	private
	#from http://www.xyzpub.com/en/ruby-on-rails/3.2/queries.html
	def search_events(query)
		events = Event.where('name LIKE ?', '%'+query+'%')
	end

	def event_params
		params.permit(:creator_id, :position_id, :name)
	end
end