module Api
  module V1
    class NodesController < BaseController
      before_action :set_hypernet, only: [:index, :create]

      private
      def build_new_resource(params)
        @hypernet.nodes.new params
      end

      def set_resource
        set_hypernet
        super
      end

      def set_hypernet
        @hypernet = Hypernet.find params[:hypernet_id]
      end

      def permitted_params
        params.require(:node).permit().tap do |whitelisted|
          whitelisted[:data] = params[:node][:data]
        end
      end

      def resource
        @hypernet.nodes.find params[:id]
      end

      def resources
        @hypernet.nodes
      end
    end
  end
end