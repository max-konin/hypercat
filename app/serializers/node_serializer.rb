class NodeSerializer < ActiveModel::Serializer
  attributes :id, :data, :name

  has_one :geometry
  has_one :hypernet, embed: :id
end
