class Node
  include Mongoid::Document

  field :data

  belongs_to :hypernet

  validates_presence_of :hypernet
end
