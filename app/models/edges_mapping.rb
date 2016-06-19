class EdgesMapping
  include Mongoid::Document

  belongs_to :hypernet
  belongs_to :branch, class_name: 'Edge'
  has_and_belongs_to_many :edges, class_name: 'Edge'

  validates_presence_of :hypernet, :branch
end
