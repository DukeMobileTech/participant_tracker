module Api
  module V1
    class ParticipantPropertiesController < ApiApplicationController
      include SynchAble
      respond_to :json

      def index
        respond_with changed_models(ParticipantProperty, params[:last_sync_time])
      end

      def create
        @participant_property = ParticipantProperty.new(participant_property_params)
        if @participant_property.save
          render json: @participant_property, status: :created
        else
          render nothing: true, status: :unprocessable_entity
        end
      end

      def update
        @participant_property = ParticipantProperty.find(params[:id])
        if @participant_property.update_attributes(participant_property_params)
          render json: @participant_property, status: :ok
        else
          render nothing: true, status: :unprocessable_entity
        end
      end

      private
      def participant_property_params
        params.require(:participant_property).permit(:property_id, :value, :uuid, :participant_uuid)
      end

    end
  end
end