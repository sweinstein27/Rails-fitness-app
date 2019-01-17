class UsersChallengeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :challenge_id

  belongs_to :user
  belongs_to :challenge
  
end
