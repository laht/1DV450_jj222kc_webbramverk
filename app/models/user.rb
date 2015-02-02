class User < ActiveRecord::Base
    has_secure_password
    
    #validation for name
    validates :name, :presence => {:message => 'Du måste ange ett namn'}
    
    #validation for password
    validates :password_confirmation, :presence =>true
    
    #validation for email
    validates :email, 
    :presence => {:message => 'Du måste ange en epost'}, 
    :uniqueness => {:message => 'Eposten är redan registrerad'}
    
    validates_format_of :email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
    :presence => {:message => 'Felaktigt format på eposten'}
    
    
    def login
        appUser = User.find_by_email(params[:email])
        
        if appUser && appUser.authenticate(params[:password])
            session[:userid] = appUser.id
            #redirect_to get api key path
        else
            if !appUser
                flash[:notice] = 'Hittade inte eposten'
            end
            redirect_to root_path
        end
    end
end
