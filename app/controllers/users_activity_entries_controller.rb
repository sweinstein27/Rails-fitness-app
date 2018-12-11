class UsersActivityEntriesController < ApplicationController
    before_action :require_login

    def new
        binding.pry
        @activity = UsersActivityEntry.new
        @data = ActivityDatum.all
    end

    def create
        binding.pry
        weight_class = current_user.weight_class
        @activity = ActivityDatum.find_by(id: params[:users_activity_entry][:id])
        hours = params[:users_activity_entry][:minutes].to_f/60
        cals_burned = (@activity.cals_burned(weight_class, hours)).to_i
    
        @entry = UsersActivityEntry.new(user_id: session[:user_id], activity_entry_id: params[:users_activity_entry][:id], minutes: params[:users_activity_entry][:minutes])
        binding.pry
        if @entry.save
            redirect_to user_path(current_user)
        else
            redirect_to new_activity_entries_user_path
        end
    end

    def index
    end
end
