module Api
  module V1
    class PropertiesController < ApiApplicationController
      include SynchAble
      respond_to :json

      def index
        @properties = changed_models(Property, 'properties', params[:last_sync_time])
      end
    end
  end
end
