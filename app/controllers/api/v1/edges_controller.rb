module Api
  module V1
    class EdgesController < BaseController
      before_action :set_graph, only: [:index, :create]

      private
      def build_new_resource(params)
        @graph.edges.new params
      end

      def set_resource
        set_graph
        super
      end

      def set_graph
        @graph = Graph.find params[:graph_id]
      end

      def permitted_params
        res = params.require(:edge).permit(:source_id, :target_id, :graph_id, :name)
        data = params.require(:edge)[:data]
        res[:data] = JSON.parse(data) unless data.blank?
        res
      end

      def resource
        @graph.edges.find params[:id]
      end

      def resources
        @graph.edges
      end
    end
  end
end