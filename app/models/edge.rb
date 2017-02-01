class Edge < RelBase

  field :name, type: String
  field :data, type: Hash

  belongs_to :graph, index: true

  validates_presence_of :graph, :name

  after_create :add_nodes_to_graph

  private
  def add_nodes_to_graph
    graph.nodes << nodes
  end
end
