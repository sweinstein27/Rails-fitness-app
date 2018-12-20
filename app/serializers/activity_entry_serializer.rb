class ActivityEntrySerializer < ActiveModel::Serializer
  attributes :id, :minutes, :name, :calories_burned, :user_id, :activity_datum_id
end
