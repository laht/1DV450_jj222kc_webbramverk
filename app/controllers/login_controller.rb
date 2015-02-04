class LoginController < ApplicationController
    
    def login
        email = params[:email]
        password = params[:password]
        message = "";
        appUser = User.find_by_email(email)
        
        if appUser && appUser.authenticate(password)
            session[:userid] = appUser.id
            redirect_to auth_token_path
        else
            if email == ""
                message = 'Du måste ange en epost'
            elsif password == ""
                message = 'Du måste ange ett lösenord'
            else
                message = "Fel epost och/eller lösenord"
            end
            redirect_to root_path, :notice => message #return user to the login page
        end
    end
    
    def logout
        session[:userid] = nil
        redirect_to root_path, :notice => 'Du har loggats ut'
    end
    
end
