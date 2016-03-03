class Edge
  include Mongoid::Document

  field :name, type: String
  field :data, type: Hash

  belongs_to :target, class_name: 'Node'
  belongs_to :source, class_name: 'Node'
  belongs_to :graph

  validates_presence_of :target, :source, :graph, :name
end
