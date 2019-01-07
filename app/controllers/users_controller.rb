class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create, :new_admin]
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:error]= @user.errors.full_messages.first if @user.errors.any?
        render 'new'
      end
    end

    def delete_activity
      if @user.activity_entries.find_by(id: params[:id])
        @activity_entry = @user.activity_entries.find_by(id: params[:id])
        @activity_entry.delete
      end
      redirect_to user_path(@user)
    end
  
    def show
      if !!permission == true
				@user = find_user
				
				respond_to do |f|
					f.html {render :show}
					f.json {render json: @user}
				end
      else
        redirect_to user_path(@user)
			end

    end
  
    def edit
      @user = find_user
    end
  
    def update
      @user = find_user
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        render :edit
      end
    end
  
    def destroy
      find_user.destroy
      redirect_to root_path
    end

    def index
      @users = User.all
      if @user.admin
        respond_to do |f|
          f.html {render :index }
          f.json {render json:  @users }
        end
      else
        redirect_to user_path(@user)
			end

    end
  
    # Admin actions
  
    def new_admin
      @user = User.new
    end
  
    # Avatar actions
  
    def avatar
      @user = User.find(params[:user_id])
      @user.update(avatar: params[:avatar_id])
    end
  
    private
  
      def find_user
        User.find(params[:id])
      end
  
      def user_params
        params.require(:user).permit(
          :username,
          :first_name,
          :last_name,
          :city,
          :password,
          :password_confirmation,
          :age,
          :weight,
          :admin,
          :email
        )
      end
  
  end