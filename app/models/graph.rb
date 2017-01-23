class Graph
  include Mongoid::Document

  field :name, type: String

  belongs_to :hypernet

  has_many :edges, dependent: :destroy
  has_and_belongs_to_many :nodes

  validates_presence_of :name
end
