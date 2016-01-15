module Api
  module V1
    class GraphsController < BaseController
      before_action :set_hypernet, only: [:index, :create]

      private
      def build_new_resource(params)
        @hypernet.graphs.new params
      end

      def set_resource
        set_hypernet
        super
      end

      def set_hypernet
        @hypernet = Hypernet.find params[:hypernet_id]
      end

      def permitted_params
        params.require(:graph).permit(:name)
      end

      def resource
        @hypernet.graphs.find params[:id]
      end

      def resources
        @hypernet.graphs
      end
    end
  end
end