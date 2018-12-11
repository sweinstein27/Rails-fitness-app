class ActivityEntry < ApplicationRecord
    has_many :users_activity_entries
    has_many :users, through: :users_activity_entries
    
  
    def all
      @activity_entries = ActivityEntry.all
    end
  end