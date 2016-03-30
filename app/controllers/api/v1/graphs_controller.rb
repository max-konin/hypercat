module Api
  module V1
    class GraphsController < BaseController
      before_action :set_hypernet, only: [:index]

      private
      def build_new_resource(params)
        Graph.new params
      end

      def set_hypernet
        @hypernet = Hypernet.find params[:hypernet_id]
      end

      def permitted_params
        params.require(:graph).permit :name, :hypernet_id
      end

      def resource
        Graph.find params[:id]
      end

      def resources
        @hypernet.graphs
      end
    end
  end
end