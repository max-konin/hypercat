module Api
  module V1
    class NodesController < BaseController
      before_action :set_hypernet, only: [:index]

      private
      def build_new_resource(params)
        Node.new params
      end


      def set_hypernet
        @hypernet = Hypernet.find params[:hypernet_id]
      end

      def permitted_params
        res = params.require(:node).permit(:name, :hypernet_id, geometry: [:_type, :x, :y])
        data = params.require(:node)[:data]
        res[:data] = JSON.parse(data) unless data.blank?
        res
      end

      def resource
        Node.find params[:id]
      end

      def resources
        @hypernet.nodes
      end
    end
  end
end