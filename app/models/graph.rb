class Graph
  include Mongoid::Document

  field :name, type: String

  belongs_to :hypernet

  has_many :edges, dependent: :destroy
end
