class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at, :members, :standups
end
