class UsersController < ApplicationController
    def index
        if !current_user.nil?
            if !is_admin
                redirect_to auth_token_path                
            end
        end
    end
    
    def new
        @user = User.new
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
