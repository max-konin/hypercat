class EdgesMapping
  include Mongoid::Document

  belongs_to :graphs_mapping, index: true
  belongs_to :branch, class_name: 'Edge', index: true
  has_and_belongs_to_many :edges, class_name: 'Edge'

  validates_presence_of :graphs_mapping, :branch
end
