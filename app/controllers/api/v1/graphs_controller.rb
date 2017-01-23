module Api
  module V1
    class GraphsController < BaseController
      before_action :set_hypernet, only: [:index]

      def create
        if params[:generate].present?
          begin
            set_hypernet
            graph = GraphGenerator.new(@hypernet, params[:generate][:type], params[:generate]).generate(params[:generate][:name])
            respond_with graph, location: false
          rescue
            head 422
          end
        else
          super
        end
      end

      private
      def build_new_resource(params)
        Graph.new params
      end

      def set_hypernet
        @hypernet = Hypernet.find(params[:hypernet_id] || params.require(:graph)[:hypernet_id])
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