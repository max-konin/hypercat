class EdgesMappingSerializer < ActiveModel::Serializer
  attributes :id, :branch_id, :graphs_mapping_id, :edge_ids
end
