class GraphGenerator
  def initialize(hypernet, type, options = {})
    @generator = "GraphGenerator::#{type.classify}".constantize.new hypernet, options
  rescue
    raise ArgumentError
  end

  def generate(graph_name)
    @generator.generate graph_name
  end
end