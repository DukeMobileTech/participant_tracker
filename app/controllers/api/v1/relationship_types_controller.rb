module Api
  module V1
    class RelationshipTypesController < ApiApplicationController
      respond_to :json

      def index
        if params[:last_sync_time].blank?
          respond_with RelationshipType.with_deleted
        else
          last_sync_time = Time.at(params[:last_sync_time].to_i/1000).to_datetime
          respond_with RelationshipType.with_deleted.where('updated_at >= ?', last_sync_time)
        end
      end

    end
  end
end