class UsersController < ApplicationController
    def index
        if !current_user.nil?
            redirect_to auth_token_path
        end
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
            Token.create user_id = u.id
            redirect_to auth_token_path
        end
    end
    
	private
	
	def user_params
		params.require(:user).permit(:name, 
	                                 :email, 
	                                 :password, 
	                                 :password_confirmation);
	end
end
