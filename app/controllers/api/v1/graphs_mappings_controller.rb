module Api
  module V1
    class GraphsMappingsController < BaseController
      before_action :set_hypernet, only: [:index]

      private
      def set_hypernet
        @hypernet = ::Hypernet.find params[:hypernet_id]
      end

      def permitted_params
        params.require(:graphs_mapping).permit :source_id, :target_id, :hypernet_id
      end

      def resource
        ::GraphsMapping.find params[:id]
      end

      def resources
        @hypernet.graphs_mappings
      end
    end
  end
end