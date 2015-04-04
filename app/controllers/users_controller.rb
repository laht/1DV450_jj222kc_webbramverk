class UsersController < ApplicationController
    before_action :require_login, only: [:index]

    def index
        if !current_user.nil?
            if !is_admin
                redirect_to auth_token_path                
            end
            @users = User.all
        end
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        messages = Array.new

        if @user.save
            t = Token.new
            t.user_id = @user.id
            t.save
            redirect_to auth_token_path
        else
            render :action => 'new'
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
