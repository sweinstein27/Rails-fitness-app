class AddAvatarToUsers < ActiveRecord::Migration
    def change
      add_column :users, :avatar, :integer, null: true
    end
  end