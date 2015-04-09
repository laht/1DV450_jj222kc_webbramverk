class TagsController < ApplicationController
	before_action :api_token_authorization
	before_filter :verify_users_creds, :only => [:create, :update, :destroy]
	def index
		if params[:event_id]
			@tags = Event.find(params[:event_id]).tags
		else
			@tags = Tag.all
		end
	rescue
		notFound
	end
	def show
		@tag = Tag.find(params[:id])
	rescue
		notFound
	end
	def new
		@tag = Tag.new
	end

	def create
		@tags = Tag.all

		@tags.each do |t|
			if tag_params[:name] == t.name
				@tag = t
			end
		end

		if @tag == nil
			@tag = Tag.new(tag_params)
			if @tag.save
				render :template => '/tags/show', :status => :created
			else
				bad_request
			end
		else
			render :template => '/tags/conflict', :status => :conflict
		end
	end

	def destroy
		@tag = Tag.find(params[:id])

		if @tag.nil?
			notFound
		else
			@tag.destroy
			render :template => '/tags/destroy', :status => :ok
		end
	end

	def update
		@tag = Tag.find(params[:id])

		if @tag.nil?
			notFound
		elsif @tag.update_attributes(tag_params)
			render :template => '/tags/show', :status => :ok
		else
			not_modified
		end
	end

	private 
	def tag_params
		params.permit(:name)
	end
end
