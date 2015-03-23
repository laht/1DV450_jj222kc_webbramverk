class User < ActiveRecord::Base
    has_secure_password
    has_one :token
    
    #validation for name
    validates :name, :presence => {:message => 'Du måste ange ett namn'}
    
    #validation for password
    validates :password, :presence => {:message => 'Du måste ange ett lösenord'}    
    validates :password_confirmation, :presence => {:message => 'Upprepa lösenordet'}
    
    #validation for email
    validates :email, 
    :presence => {:message => 'Du måste ange en epost'}, 
    :uniqueness => {:message => 'Eposten är redan registrerad'}
    
    validates_format_of :email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
    :presence => {:message => 'Felaktigt format på eposten'}    
end
