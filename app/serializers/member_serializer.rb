class MemberSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :created_at, :updated_at, :projects, :standups
end
