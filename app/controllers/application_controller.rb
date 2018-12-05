class ApplicationController < ActionController::Base
  

  helper_method :current_user


  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    redirect_to root_path unless logged_in?
  end

  def permission
    current_user.id === params[:id].to_i
  end

  private

  def authenticate_user
    client_id = ENV['GITHUB_CLIENT_ID']
    redirect_uri = CGI.escape("http://localhost:3000/auth")
    github_url = "https://github.com/login/oauth/authorize?client_id=#{client_id}&scope=repo"
    redirect_to github_url unless logged_in?
  end



end