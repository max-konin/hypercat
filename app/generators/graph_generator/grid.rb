class GraphGenerator
  class Grid < Base
    def initialize(hypernet, options = {})
      @n = options[:n].to_i
      @m = options[:m].to_i
      raise ArgumentError if @n.nil? || @m.nil?
      @hypernet = hypernet
    end

    def generate(graph_name)
      graph = @hypernet.graphs.create name: graph_name

      latest_layer = nil

      @n.times do |i|
        nodes = []
        @m.times do |j|
          node = Node.create name: "v#{i}/#{j}", hypernet: @hypernet
          graph.nodes << node

          if nodes.last.present?
            graph.edges.create source: nodes.last, target: node, name: "e#{nodes.last.name}-#{node.name}"
          end

          if latest_layer.present?
            source_node = latest_layer[nodes.size]
            graph.edges.create source: source_node, target: node, name: "e#{source_node.name}-#{node.name}"
          end

          nodes << node

        end
        latest_layer = nodes
      end

      graph
    end
  end
end