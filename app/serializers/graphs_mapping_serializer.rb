class GraphsMappingSerializer < ActiveModel::Serializer
  attributes :id, :source_id, :target_id, :hypernet_id
end
