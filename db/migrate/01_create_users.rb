class CreateUsers < ActiveRecord::Migration[5.2]
    def change
      create_table :users do |t|
        t.string :username
        t.string :first_name
        t.string :last_name
        t.string :city
        t.string :password_digest
        t.integer :age
        t.integer :weight
  
        t.timestamps
      end
    end
  end