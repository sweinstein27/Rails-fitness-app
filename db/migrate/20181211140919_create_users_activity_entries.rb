class CreateUsersActivityEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :users_activity_entries do |t|
      t.references :user, foreign_key: true
      t.references :activity_entry, foreign_key: true
      t.integer :minutes

    end
  end
end