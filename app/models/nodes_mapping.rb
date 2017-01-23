class NodesMapping < RelBase

  belongs_to :graphs_mapping, index: true

  validates_presence_of :hypernet
end
