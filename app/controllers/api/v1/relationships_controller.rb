module Api
  module V1
    class RelationshipsController < ApiApplicationController
      respond_to :json

      def index
        if params[:last_sync_time].blank?
          respond_with Relationship.with_deleted
        else
          last_sync_time = Time.at(params[:last_sync_time].to_i/1000).to_datetime
          respond_with Relationship.with_deleted.where('updated_at >= ?', last_sync_time)
        end
      end

      def create
        @relationship = Relationship.new(relationship_params)
        if @relationship.save
          render json: @relationship, status: :created
        else
          render nothing: true, status: :unprocessable_entity
        end
      end

      def update
        @relationship = Relationship.find(params[:id])
        if @relationship.update_attributes(relationship_params)
          render json: @relationship, status: :ok
        else
          render nothing: true, status: :unprocessable_entity
        end
      end

      private
      def relationship_params
        params.require(:relationship).permit(:participant_owner_uuid, :participant_related_uuid, :uuid, :relationship_type_id)
      end

    end
  end
end