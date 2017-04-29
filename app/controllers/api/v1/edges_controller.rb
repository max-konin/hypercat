module Api
  module V1
    class EdgesController < BaseController
      before_action :set_graph, only: [:index]

      private
      def build_new_resource(params)
        Edge.new params
      end

      def set_graph
        @graph = Graph.find params[:graph_id]
      end

      def permitted_params
        res = params.require(:edge).permit(:graph_id, :name, :source_id, :target_id)
        data = params.require(:edge)[:data]
        res[:data] = JSON.parse(data) unless data.blank?
        res
      end

      def resource
        Edge.find params[:id]
      end

      def resources
        @graph.edges
      end
    end
  end
end