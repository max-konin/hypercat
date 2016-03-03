class Node
  include Mongoid::Document

  field :name, type: String
  field :data, type: Hash

  belongs_to :hypernet

  validates_presence_of :hypernet, :name
end
