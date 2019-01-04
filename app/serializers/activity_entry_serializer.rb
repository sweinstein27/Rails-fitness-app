class ActivityEntrySerializer < ActiveModel::Serializer
	attributes :id, :minutes, :name, :calories_burned, :user_id, :activity_datum_id, :created_at
	
	belongs_to :user
	belongs_to :activity_datum

end
