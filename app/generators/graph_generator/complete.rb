class GraphGenerator
  class Complete < Base
    def initialize(hypernet, options = {})
      @n = options[:n].to_i
      raise ArgumentError if @n.nil?
      @hypernet = hypernet
    end

    def generate(graph_name)
      graph = @hypernet.graphs.create name: graph_name

      connect_nodes generate_nodes(graph), graph
    end

    private
    def generate_nodes(graph)
      @n.times do |i|
        node = Node.create name: "v#{i}", hypernet: @hypernet
        graph.nodes << node
      end

      graph.nodes
    end

    def connect_nodes(nodes, graph)
      nodes.each do |n1|
        nodes.each do |n2|
          if n1.id != n2.id
            graph.edges.create nodes: [n1, n2], name: "e#{n1.name}-#{n2.name}"
          end
        end
      end

      graph
    end
  end
end