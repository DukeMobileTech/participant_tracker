module Api
  module V1
    class ParticipantsController < ApiApplicationController
      include SynchAble
      respond_to :json

      def index
        project = Project.find(params[:project_id])
        @participants = changed_models(project.participants, 'participants', params[:last_sync_time])
      end

      def create
        project = Project.find(params[:project_id])
        participant = project.participants.new(participant_params)
        if participant.save
          render json: participant, status: :created
        else
          render nothing: true, status: :unprocessable_entity
        end
      end

      def update
        project = Project.find(params[:project_id])
        participant = project.participants.find(params[:id])
        if participant.update_attributes(participant_params)
          render json: participant, status: :ok
        else
          render nothing: true, status: :unprocessable_entity
        end
      end

      def batch_create
        Participant.transaction do
          project = Project.find(params[:project_id])
          puts params[:participants]
          params[:participants].each do |record|
            participant = project.participants.new(participant_params(record))
            participant.save
          end
        end
        head :ok
      end

      def batch_update
        Participant.transaction do
          project = Project.find(params[:project_id])
          puts params[:participants]
          params[:participants].each do |record|
            participant = project.participants.find(record[:id])
            participant.update_attributes(participant_params(record))
          end
        end
        head :ok
      end

      private

      def participant_params(record)
        if record.nil?
          params.require(:participant).permit(:participant_type_id, :uuid, :device_uuid, :device_label, :project_id, :active)
        else
          record.permit(:participant_type_id, :uuid, :device_uuid, :device_label, :project_id, :active)
        end
      end
    end
  end
end
