class UsersController < ApplicationController
    def index
        @User = User.first
    end
    def show
        render :html => User.first(params[:id]) #glöm fan inte att ändra det här
    end
end
