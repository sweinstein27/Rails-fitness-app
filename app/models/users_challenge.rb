class UsersChallenge < ApplicationRecord
    belongs_to :user
    belongs_to :challenge, dependent: :destroy
  
    validates :user_id, uniqueness: {scope: :challenge_id}
  end