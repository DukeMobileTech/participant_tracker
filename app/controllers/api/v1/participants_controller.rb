module Api
  module V1
    class ParticipantsController < ApiApplicationController
      respond_to :json

      def index
        if params[:last_sync_time].blank?
          respond_with Participant.with_deleted
        else
          last_sync_time = Time.at(params[:last_sync_time].to_i/1000).to_datetime
          respond_with Participant.with_deleted.where('updated_at >= ?', last_sync_time)
        end
      end

      def create
        @participant = Participant.new(participant_params)
        if @participant.save
          render json: @participant, status: :created
        else
          render nothing: true, status: :unprocessable_entity
        end
      end

      def update
        @participant = Participant.find(params[:id])
        if @participant.update_attributes(participant_params)
          render json: @participant, status: :ok
        else
          render nothing: true, status: :unprocessable_entity
        end
      end

      private
      def participant_params
        params.require(:participant).permit(:participant_type_id, :uuid, :device_uuid, :device_label)
      end
    end
  end
end
