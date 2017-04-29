module Hypercat
  module ListBuilder
    class GraphAdjacency
      def initialize(graph)
        raise ArrgumentError.new('graph should be instance of Graph') unless graph.is_a? Graph

        @graph = graph
      end

      def result
        Edge.collection.aggregate(pipeline)
      end

      protected
      def pipeline
        pipeline = []

        pipeline << { '$match': {graph_id: @graph.id} }
        pipeline << { '$project': {node_ids: 1, sources: '$node_ids'} }
        pipeline << { '$unwind': '$sources'}
        pipeline << { '$unwind': '$node_ids'}
        pipeline << { '$project': { 'sources': 1, 'node_ids': 1, s_eq_t: {'$eq': ['$sources', '$node_ids']}}}
        pipeline << { '$match': { s_eq_t: false }}
        pipeline << { '$group': {_id: '$sources', node_ids: {'$addToSet': '$node_ids'}}}
        pipeline
      end
    end
  end
end