class ChallengeSerializer < ActiveModel::Serializer
  attributes :name, :rules, :start_date, :end_date, :id
  
  has_many :users_challenges
  has_many :users, through: :users_challenges
end
