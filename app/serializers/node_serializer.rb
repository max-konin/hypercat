class NodeSerializer < ActiveModel::Serializer
  attributes :id, :data, :name, :hypernet_id

  has_one :geometry
end
