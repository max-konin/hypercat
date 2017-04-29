class RelBase
  include Mongoid::Document

  has_and_belongs_to_many :nodes, index: true

  store_in collection: :edges

  validates :node_ids, length: { minimum: 2 }
end
