module Api
  module V1
    class ParticipantsController < ApiApplicationController
      include SynchAble
      respond_to :json

      def index
        project = Project.find(params[:project_id])
        respond_with changed_models(project.participants, 'participants', params[:last_sync_time])
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

      private

      def participant_params
        params.require(:participant).permit(:participant_type_id, :uuid, :device_uuid, :device_label, :project, :active)
      end
    end
  end
end
