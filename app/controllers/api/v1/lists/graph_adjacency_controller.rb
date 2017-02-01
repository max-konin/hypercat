require Rails.root.join('lib/hypercat/list_builder/graph_adjacency')

module Api
  module V1
    module Lists
      class GraphAdjacencyController < ActionController::API
        respond_to :json

        def show
          graph = Graph.find params[:id]
          builder = Hypercat::ListBuilder::GraphAdjacency.new graph
          respond_with builder.result.to_a, root: false
        end
      end
    end
  end
end