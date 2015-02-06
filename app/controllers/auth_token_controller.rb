class AuthTokenController < ApplicationController
    before_action :require_login
    
    def index
        @token = current_user.token.token
    end
    
    def delete_token
        current_user.token.token = nil
        current_user.token.save
        redirect_to action: :index
    end
    
    def gen_token
        current_user.token.token = assign_token
        current_user.token.save
        redirect_to auth_token_path
    end
    
    private 
    
    def assign_token
        token = getTokenValue
        
        while validateToken(token)
            token = getTokenValue
        end
        
        return token
    end
    
    def validateToken(token)
        tokens = Token.pluck :token
        return tokens.include? token
    end
    
    def getTokenValue
        Random.new_seed
    end
end
