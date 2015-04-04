class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def api_token_authorization
    token = request.headers['X-Access-Token']
    t = Token.where(token: token).take    
    if !t
      response.status = 401
      error = {
        status: 401,
        message: "Unauthorized"
      }
      render :json => error
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
