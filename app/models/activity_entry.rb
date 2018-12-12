class ActivityEntry < ApplicationRecord
      belongs_to :user
      belongs_to :activity_datum
    
  
    def all
      @activity_entries = ActivityEntry.all
    end
  end