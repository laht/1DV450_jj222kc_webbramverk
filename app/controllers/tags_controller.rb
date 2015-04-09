class TagsController < ApplicationController
	before_action :verify_users_creds
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
		t = Tag.new(tag_params)

		if t.save
			redirect_to tag_url(t.id)
		else
			render :json => 
					{ :developer_message => 'Something went wrong while creating the resource.',
					  :user_message => 'The resource was not saved. Please try again.',
					  :api_startpage => resources_url
					},:status => :conflict
		end
	end
end
