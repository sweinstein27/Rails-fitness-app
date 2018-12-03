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
      auth = request.env["omniauth.auth"]
      if User.find_by(uid: auth[:uid])
        @user = User.find_by(uid: auth[:uid])
      else
        @user = User.create_with_omniauth(auth)
      end
      binding.pry
      reset_session
      session[:user_id] = @user.id
      redirect_to users_path(@user), :notice => 'Signed in!'
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