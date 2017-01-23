class GraphsMapping
  include Mongoid::Document

  belongs_to :hypernet, index: true
  belongs_to :target, class_name: 'Graph', index: true
  belongs_to :source, class_name: 'Graph', index: true

  has_many :edges_mappings, dependent: :destroy
  has_many :nodes_mappings, dependent: :destroy

  validates_presence_of :target, :source
end
