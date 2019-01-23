class ChallengesController < ApplicationController
    before_action :require_login
  
    def index
      @challenges = @user.challenges
      respond_to do |f|
        f.html {render :index }
        f.json {render json:  @challenges }
      end
    end
  
    def new
      @challenge = @user.challenges.new

    end
  
    def create
      @challenge = @user.challenges.create(challenge_params)
      @challenge.user_id = @user.id
      @challenge.save
      if @challenge.save
        render json: @challenge, status: 201
      else
        render :new
      end
    end
  
    def show
      @challenge = Challenge.find_by(id: params[:id])
    end
  
    def edit
      @challenge = current_challenge
    end
  
    def update
      @challenge = current_challenge
      if @challenge.update(challenge_params)
        redirect_to challenge_path(@challenge)
      else
        render :edit
      end
    end
  
    def destroy
      binding.pry
      @challenge = @user.challenges.find_by(id: params[:id])
      @challenge.destroy
      redirect_to user_challenges_path(@user)
    end
  
  private
  
  
    def challenge_params
      params.require(:challenge).permit(:name,:rules, :start_date, :end_date, :id)
    end
  end