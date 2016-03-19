class Geometry::PointSerializer < ActiveModel::Serializer
  attributes :id, :x, :y, :_type
end
