class EdgeSerializer < ActiveModel::Serializer
  attributes :id, :target_id, :source_id, :hypernet_id
end
