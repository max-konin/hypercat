class Mapping
  include Mongoid::Document

  belongs_to :hypernet
  belongs_to :source, class_name: 'Edge'
  belongs_to :target, class_name: 'Edge'

  validates_presence_of :hypernet, :source, :target
end
