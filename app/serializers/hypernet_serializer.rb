class HypernetSerializer < ActiveModel::Serializer
  attributes :id, :name

  embed :ids
end
