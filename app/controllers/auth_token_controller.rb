class AuthTokenController < ApplicationController
    before_action :require_login
    
    def index
        if current_user.token.token.nil?
            render :text => "du har ingen token ännu, det kommer snart gå att beställa en"
        else
            render :text => current_user.token.token
        end
    end
end
