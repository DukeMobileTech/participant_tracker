module Api
  module V1
    class RelationshipTypesController < ApiApplicationController
      include SynchAble
      respond_to :json

      def index
        @relationship_types = changed_models(RelationshipType, 'relationship_types', params[:last_sync_time])
      end
    end
  end
end
