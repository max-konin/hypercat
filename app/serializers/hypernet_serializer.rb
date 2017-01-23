class HypernetSerializer < ActiveModel::Serializer
  attributes :id, :name

  embed :ids

  has_many :nodes
  has_many :graphs
end
