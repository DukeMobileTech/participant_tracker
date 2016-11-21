module Api
  module V1
    class RelationshipTypesController < ApiApplicationController
      include SynchAble
      respond_to :json

      def index
        respond_with changed_models(RelationshipType, params[:last_sync_time])
      end

    end
  end
end