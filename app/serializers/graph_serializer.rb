class GraphSerializer < ActiveModel::Serializer
  attributes :id, :name, :hypernet_id

  embed :ids
end
