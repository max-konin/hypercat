class NodeSerializer < ActiveModel::Serializer
  attributes :id, :data, :hypernet_id, :name

  has_one :geometry
end
