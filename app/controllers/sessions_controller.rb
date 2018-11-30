class SessionsController < ApplicationController
  skip_before_action :authenticate_user
    def new
      @user = User.new
    end
  
    def create
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:error] = "Username or password is incorrect."
        redirect_to login_path
      end
    end

    def create
      @user = User.find_or_create_from_auth_hash(auth_hash)
      self.current_user = @user
      redirect_to root_path
    end

  
    def destroy
      session[:user_id] = nil
      redirect_to root_path
    end

    protected

    def auth_hash
      request.env['omniauth.auth']
    end
  
  end