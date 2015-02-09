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
        u = User.new(user_params)
        messages = Array.new

        if u.save
            Token.create user_id = u.id
            redirect_to auth_token_path
        else
            if params[:user][:name] == '' || 
                params[:user][:name].nil?
                messages.push 'Ange ett namn'
            end
            if params[:user][:email] == '' || 
                params[:user][:email].nil?
                messages.push 'Ange en epost'
            end
            if params[:user][:password] == '' || 
                params[:user][:password].nil?
                messages.push 'Ange ett lösenord'
            end
            if params[:user][:password] != 
                params[:user][:password_confirmation]
                messages.push 'Lösenorder överensstämmer inte'
            end
        end     
        redirect_to new_user_path, :notice => messages
    end
    
	private
	
	def user_params
		params.require(:user).permit(:name, 
	                                 :email, 
	                                 :password, 
	                                 :password_confirmation);
	end
end
