class ChallengesController < ApplicationController
    before_action :require_login
  
    def index
      @challenges = @user.challenges
    end
  
    def new
      @challenge = @user.challenges.new

    end
  
    def create
      @challenge = @user.challenges.new(challenge_params)
      if @challenge.save
        redirect_to challenge_path(@challenge)
      else
        render :new
      end
    end
  
    def show
      @challenge = current_challenge
      binding.pry
    end
  
    def edit
      #this should only be a feature for the person who created this challenge
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
      #this should only be a feature for the person who created this challenge
      @challenge = current_challenge
      @challenge.destroy
      redirect_to challenges_path
    end
  
  private
  
    def current_challenge
      Challenge.find(params[:id])
    end
  
    def challenge_params
      params.require(:challenge).permit(:name,:rules, :start_date, :end_date, :id)
    end
  end