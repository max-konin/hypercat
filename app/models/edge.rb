class Edge
  include Mongoid::Document

  field :data

  belongs_to :target, class_name: 'Node'
  belongs_to :source, class_name: 'Node'
  belongs_to :graph

  validates_presence_of :target, :source, :graph
end
