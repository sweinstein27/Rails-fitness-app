class UserSerializer < ActiveModel::Serializer
	attributes :id, :username, :first_name, :last_name, :city, :password, :password_confirmation, :age, :weight, :admin, :email

	has_many :activity_entries
	has_many :activity_datum
	
	has_many :users_challenges
	has_many :challenges
end
