module Api
  module V1
    class ParticipantTypesController < ApiApplicationController
      include SynchAble
      respond_to :json

      def index
        respond_with changed_models(ParticipantType, 'participant_types', params[:last_sync_time])
      end
    end
  end
end
