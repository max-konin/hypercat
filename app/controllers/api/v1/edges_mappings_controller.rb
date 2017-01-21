module Api
  module V1
    class EdgesMappingsController < BaseController
      before_action :set_graphs_mapping, only: [:index]

      private
      def set_resource
        super
      end

      def set_graphs_mapping
        @graphs_mapping = ::GraphsMapping.find params[:graphs_mapping_id]
      end

      def permitted_params
        params.require(:edges_mapping).permit :branch_id, :graphs_mapping_id, edges_ids: []
      end

      def resource
        ::EdgesMapping.find params[:id]
      end

      def resources
        @graphs_mapping.edges_mappings
      end
    end
  end
end