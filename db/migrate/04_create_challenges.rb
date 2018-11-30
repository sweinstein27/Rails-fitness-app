class CreateChallenges < ActiveRecord::Migration
    def change
      create_table :challenges do |t|
        t.string :name
        t.string :rules
        t.datetime :start_date
        t.datetime :end_date
        t.references :user
  
        t.timestamps
      end
    end
  end