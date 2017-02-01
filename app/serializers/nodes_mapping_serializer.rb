class EdgeSerializer < ActiveModel::Serializer
  attributes :id, :target_id, :node_ids
end
