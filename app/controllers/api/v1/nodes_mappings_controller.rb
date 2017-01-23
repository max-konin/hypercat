module Api
  module V1
    class NodesMappingsController < BaseController
      before_action :set_hypernet

      private
      def set_hypernet
        @hypernet = Hyper
      end

      def permitted_params
        params.require(:edge).permit(:source_id, :target_id, :hypernet_id, :name)
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