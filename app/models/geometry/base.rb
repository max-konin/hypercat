module Geometry
  class Base
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic

    field :_type
  end
end
