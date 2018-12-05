class AddAvatarToUsers < ActiveRecord::Migration[5.2]
    def change
      add_column :users, :avatar, :integer, null: true
    end
  end