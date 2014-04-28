module Api
  module V1
    class ParticipantPropertiesController < ApiApplicationController
      respond_to :json
      
      def index
        respond_with ParticipantProperty.all
      end  
      
      def create
        @participant_property = ParticipantProperty.new(participant_property_params)
        if @participant_property.save
          render json: @participant_property, status: :created
        else
          render nothing: true, status: :unprocessable_entity
        end
      end 
       
      private
      def participant_property_params
        params.require(:participant_property).permit(:participant_id, :property_id, :value, :uuid)
      end
         
    end  
  end
end