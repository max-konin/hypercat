class Hypernet
  include Mongoid::Document

  field :name

  has_many :nodes,           dependent: :destroy
  has_many :graphs,          dependent: :destroy
  has_many :graphs_mappings, dependent: :destroy
end
