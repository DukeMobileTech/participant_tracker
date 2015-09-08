module Api
  module V1
    class ParticipantPropertiesController < ApiApplicationController
      respond_to :json

      def index
        if params[:last_sync_time].blank?
          respond_with ParticipantProperty.with_deleted
        else
          last_sync_time = Time.at(params[:last_sync_time].to_i/1000).to_datetime
          respond_with ParticipantProperty.with_deleted.where('updated_at >= ?', last_sync_time)
        end
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