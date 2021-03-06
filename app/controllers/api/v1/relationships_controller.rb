module Api
  module V1
    class RelationshipsController < ApiApplicationController
      include SynchAble
      respond_to :json

      def index
        project = Project.find(params[:project_id])
        @relationships = changed_models(project.relationships, 'relationships', params[:last_sync_time])
      end

      def create
        project = Project.find(params[:project_id])
        relationship = project.relationships.new(relationship_params)
        if relationship.save
          render json: relationship, status: :created
        else
          render nothing: true, status: :unprocessable_entity
        end
      end

      def update
        project = Project.find(params[:project_id])
        relationship = project.relationships.find(params[:id])
        if relationship.update_attributes(relationship_params)
          render json: relationship, status: :ok
        else
          render nothing: true, status: :unprocessable_entity
        end
      end

      def batch_create
        Relationship.transaction do
          project = Project.find(params[:project_id])
          params[:relationships].each do |record|
            rel = project.relationships.new(relationship_params(record))
            rel.save
          end
        end
        head :ok
      end

      def batch_update
        Relationship.transaction do
          project = Project.find(params[:project_id])
          params[:relationships].each do |record|
            rel = project.relationships.find(record[:id])
            rel.update_attributes(relationship_params(record))
          end
        end
        head :ok
      end

      private

      def relationship_params(record)
        if record.nil?
          params.require(:relationship).permit(:participant_owner_uuid, :participant_related_uuid, :uuid, :relationship_type_id)
        else
          record.permit(:participant_owner_uuid, :participant_related_uuid, :uuid, :relationship_type_id)
        end
      end
    end
  end
end
