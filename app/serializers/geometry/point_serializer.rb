class Geometry::PointSerializer < ActiveModel::Serializer
  attributes :id, :x, :y, :type

  def type
    'geometry/point'
  end
end
