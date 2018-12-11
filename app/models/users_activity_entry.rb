class UsersActivityEntry < ApplicationRecord
    belongs_to :user
    belongs_to :activity_entry
  end
