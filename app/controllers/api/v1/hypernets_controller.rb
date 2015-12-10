module Api
  module V1
    class HypernetsController < BaseController
      private
      def permitted_params
        params.require(:hypernet).permit :name
      end
    end
  end
end