class SessionsController < ApplicationController
    def new
      @user = User.new
    end

    def create_with_omniauth
      auth = request.env["omniauth.auth"]
      @user = User.find_by(username: auth[:info][:nickname])
      if @user.nil?
        @user = User.create_with_omniauth(auth)
      end
      reset_session
      session[:user_id] = @user.id
      redirect_to users_path(@user), :notice => 'Signed in!'
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

    
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path
    end

    protected

    def auth
      request.env['omniauth.auth']
    end

  
  end