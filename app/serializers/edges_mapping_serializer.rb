class EdgesMappingSerializer < ActiveModel::Serializer
  attributes :id, :branch_id, :hypernet_id, :edge_ids
end
