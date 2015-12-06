class Hypernet
  include Mongoid::Document

  has_many :nodes, dependent: :destroy
  has_many :graphs, dependent: :destroy
  has_many :mappings, dependent: :destroy
end
