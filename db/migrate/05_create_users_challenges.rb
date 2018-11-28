class CreateUsersChallenges < ActiveRecord::Migration
    def change
      create_table :users_challenges do |t|
        t.references :user, foreign_key: true
        t.references :challenge, foreign_key: true
  
        t.timestamps
      end
    end
  end