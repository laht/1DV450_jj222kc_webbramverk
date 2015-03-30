class CreatorsController < ApplicationController
	def index
		@creators = Creator.all
		render :json => @creators
	end
	def show
		@creator = Creator.find params[:id]
		render :json => @creator
	end
end
