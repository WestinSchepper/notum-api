class StandupSerializer < ActiveModel::Serializer
  attributes :id, :did, :doing, :impediments, :project,
  :member, :created_at, :updated_at
end
