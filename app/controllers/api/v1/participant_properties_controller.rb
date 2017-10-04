module Api
  module V1
    class ParticipantPropertiesController < ApiApplicationController
      include SynchAble
      respond_to :json

      def index
        project = Project.find(params[:project_id])
        @participant_properties = changed_models(project.participant_properties, 'participant_properties', params[:last_sync_time])
      end

      def create
        project = Project.find(params[:project_id])
        pp = project.participant_properties.new(participant_property_params)
        if pp.save
          render json: pp, status: :created
        else
          render nothing: true, status: :unprocessable_entity
        end
      end

      def update
        project = Project.find(params[:project_id])
        pp = project.participant_properties.find(params[:id])
        if pp.update_attributes(participant_property_params)
          render json: pp, status: :ok
        else
          render nothing: true, status: :unprocessable_entity
        end
      end

      def batch_create
        ParticipantProperty.transaction do
          project = Project.find(params[:project_id])
          params[:participant_properties].each do |record|
            pp = project.participant_properties.new(participant_property_params(record))
            pp.save
          end
        end
        head :ok
      end

      def batch_update
        ParticipantProperty.transaction do
          project = Project.find(params[:project_id])
          params[:participant_properties].each do |record|
            pp = project.participant_properties.find(record[:id])
            pp.update_attributes(participant_property_params(record))
          end
        end
        head :ok
      end

      private

      def participant_property_params(record)
        if record.nil?
          params.require(:participant_property).permit(:property_id, :value, :uuid, :participant_uuid)
        else
          record.permit(:property_id, :value, :uuid, :participant_uuid)
        end
      end
    end
  end
end
