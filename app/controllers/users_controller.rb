class UsersController < ApplicationController
    def index
        @user = User.all
    end
    
    def new
        @user = User.new
    end
    
    def show
        render :html => User.first(params[:id]) #glöm fan inte att ändra det här
    end
    
    def create
        u = User.new(user_params)

        if u.save
            redirect_to user_path(u)
        end
    end
    
    ##private methods
	private
	
	def user_params
		params.require(:user).permit(:name, :email, :password);
	end
end
