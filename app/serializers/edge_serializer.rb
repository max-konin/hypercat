class EdgeSerializer < ActiveModel::Serializer
  attributes :id, :data, :target_id, :source_id, :graph_id
end
