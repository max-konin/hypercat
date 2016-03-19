class Node
  include Mongoid::Document

  field :name, type: String
  field :data, type: Hash

  belongs_to :hypernet
  embeds_one :geometry, class_name: 'Geometry::Base'

  accepts_nested_attributes_for :geometry

  validates_presence_of :hypernet, :name
end
