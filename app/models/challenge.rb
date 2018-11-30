class Challenge < ApplicationRecord
    belongs_to :user 
  
    #should validate for name, start and end time;
    #only users who are logged in can create a challenge
    
  end