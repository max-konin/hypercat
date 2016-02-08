module Api
  module V1
    class MappingsController < BaseController
      before_action :set_hypernet, only: [:index, :create]

      private
      def build_new_resource(params)
        @hypernet.mappings.new params
      end

      def set_resource
        set_hypernet
        super
      end

      def set_hypernet
        @hypernet = Hypernet.find params[:hypernet_id]
      end

      def permitted_params
        params.require(:mapping).permit :branch_id, edges_ids: []
      end

      def resource
        @hypernet.mappings.find params[:id]
      end

      def resources
        @hypernet.mappings
      end
    end
  end
end