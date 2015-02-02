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
    
    #lyft ut det här till en egen controller
    def login
        appUser = User.find_by_email(params[:email])
        
        if appUser && appUser.authenticate(params[:password])
            session[:userid] = appUser.id
            redirect_to auth_token_path
        else
            if !appUser
                flash[:notice] = 'Hittade inte eposten'
            else
                flash[:notice] = 'Fel lösenord eller epost'
            end
            redirect_to root_path
        end
    end
    
    
    #lyft ut det här till en egen controller
    def view_token
        render :text => 'Här kommer din applikationsnyckel finnas tillgänglig'
    end
    
    ##private methods
	private
	
	def user_params
		params.require(:user).permit(:name, :email, :password);
	end
end
