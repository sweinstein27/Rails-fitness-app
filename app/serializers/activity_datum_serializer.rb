class ActivityDatumSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :users, through: :activity_entries
  
end
