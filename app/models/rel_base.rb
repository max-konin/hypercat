class RelBase
  include Mongoid::Document

  belongs_to :target, class_name: 'Node', index: true
  belongs_to :source, class_name: 'Node', index: true

  validates_presence_of :target, :source

  store_in collection: :edges
end
