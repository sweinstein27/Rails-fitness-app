class Challenge < ApplicationRecord
  has_many :users_challenges, dependent: :destroy
  has_many :users, through: :users_challenges
  scope :started, ->(date) { where("start_date < ?", date)}

   
  validates :name, :rules, :start_date, :end_date, presence: true
 
end
