class RelBase
  include Mongoid::Document

  has_and_belongs_to_many :nodes

  store_in collection: :edges
end
