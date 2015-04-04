class CreatorsController < ApplicationController
	before_action :api_token_authorization
	def index
		@creators = Creator.all
		render :json => @creators
	end
	def show
		@creator = Creator.find params[:id]
		render :json => @creator
	end
end
