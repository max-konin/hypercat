class Node
  include Mongoid::Document

  field :data, type: Hash

  belongs_to :hypernet

  validates_presence_of :hypernet
end
