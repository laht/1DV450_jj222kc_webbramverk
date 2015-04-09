class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def api_token_authorization
    token = request.headers['X-Access-Token']  
    t = Token.where(token: token).take    
    if !t || token.nil?
      unauthorized
    end
  end

  def get_api_user
    token = request.headers['X-Access-Token']
    token = Token.where(token: token).take
    if !token.nil
      user = token.user  
    end    
    return user
  end

  def unauthorized
     response.status = 401
      error = {
        status: 401,
        message: "Unauthorized"
      }
      render :json => error
  end

  def notFound
    render :template => 'application/NotFound', :status => 404
  end

  def bad_request
    render :template => 'application/bad_request', :status => 400
  end
  
  def match_user_creds
    authenticate_or_request_with_http_basic do |email, password|
      token = request.headers['X-Access-Token']
      token = Token.where(token: token).take      
      
      if !token.nil?
        user = token.user
      end

      return user && user.email == email && user.authenticate(password)

    end
  end

  def verify_resource_owner

  end

  def verify_users_creds
    if !match_user_creds
      unauthorized
    end
    if verify_resource_owner
      user = get_api_user
    end
  end

  private
  helper_method :current_user, :require_login  
  
  def current_user
    @current_user ||= User.find(session[:userid]) if session[:userid] rescue redirect_to root_path
  end
  
  def require_login
    if current_user.nil? then
      redirect_to root_path, :notice => "Du måste logga in"
    end
  end
  
  def is_admin
    if current_user.email == 'admin@site.com'
      return true
    end
  end
  
end
