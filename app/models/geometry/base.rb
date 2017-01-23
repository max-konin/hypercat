module Geometry
  class Base
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic

    field :_type

    embedded_in :geometrable, polymorphic: true
  end
end
