class EdgeSerializer < ActiveModel::Serializer
  attributes :id, :data, :graph_id, :name, :node_ids
end
