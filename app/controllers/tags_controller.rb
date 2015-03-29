#model.association.delete(model)

class TagsController < ApplicationController
	def index
		if params[:event_id]
			@tags = Event.find(params[:event_id]).tags
			render :json => @tags
		else
			@tags = Tag.all
			render :json => @tags
		end
	end
	def show
		@tags = Tag.all 
		render :json => @tags
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
