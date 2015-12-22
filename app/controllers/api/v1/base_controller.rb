module Api
  module V1
    class BaseController < ActionController::API
      before_action :set_resource, only: [:show, :update, :destroy]
      respond_to :json

      def index
        @resources = resources
        respond_with @resources
      end

      def show
        respond_with @resource
      end

      def update
        if @resource.update permitted_params
          respond_with @resource, status: :updated, location: false
        else
          respond_with @resource, status: :unprocessable_entity
        end
      end

      def create
        @resource = build_new_resource permitted_params
        if @resource.save
          respond_with @resource, status: :created, location: false
        else
          respond_with @resource, status: :unprocessable_entity
        end
      end

      def destroy
        @resource.destroy
        head :ok
      end

      protected
      def build_new_resource(params)
        klass.new params
      end

      def set_resource
        @resource = resource
      end

      def resource
        klass.find params[:id]
      end

      def resources
        klass.all
      end

      def klass
        self.class.to_s.gsub('Api::V1::', '').gsub!('Controller', '').singularize.constantize
      end
    end
  end
end